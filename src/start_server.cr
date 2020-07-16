require "./app"

Habitat.raise_if_missing_settings!

if Lucky::Env.development?
  Avram::Migrator::Runner.new.ensure_migrated!
  Avram::SchemaEnforcer.ensure_correct_column_mappings!
end

Avram::QueryEvent.subscribe do |event|
  SaveBreezeSqlStatement.create!(statement: event.query, args: event.args)
end

app_server = AppServer.new

Signal::INT.trap do
  app_server.close
end

app_server.listen
