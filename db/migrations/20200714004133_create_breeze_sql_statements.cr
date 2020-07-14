class CreateBreezeSqlStatements::V20200714004133 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(BreezeSqlStatement) do
      primary_key id : Int64
      add_timestamps
      add statement : String
      add args : String?
    end
  end

  def rollback
    drop table_for(BreezeSqlStatement)
  end
end
