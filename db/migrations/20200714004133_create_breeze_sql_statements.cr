class CreateBreezeSqlStatements::V20200714004133 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(BreezeSqlStatement) do
      primary_key id : Int64
      add_timestamps
      add statement : String
      add args : String?
      add_belongs_to breeze_request : BreezeRequest?, on_delete: :nullify
    end
  end

  def rollback
    drop table_for(BreezeSqlStatement)
  end
end
