require "./app"

Habitat.raise_if_missing_settings!

if Lucky::Env.development?
  Avram::Migrator::Runner.new.ensure_migrated!
  Avram::SchemaEnforcer.ensure_correct_column_mappings!
end

Avram::QueryEvent.subscribe do |event|
  req = Fiber.current.breeze_request
  spawn do
    unless event.query.includes?("FROM breeze_")
      SaveBreezeSqlStatement.create! \
        breeze_request_id: req.try(&.id),
        statement: event.query,
        args: event.args
    end
  end
end

app_server = AppServer.new

Signal::INT.trap do
  app_server.close
end

app_server.listen
