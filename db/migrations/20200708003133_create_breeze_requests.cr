class CreateBreezeRequests::V20200327160456 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(BreezeRequest) do
      primary_key id : Int64
      add_timestamps

      add path : String
      add method : String
      add action : String
      add status : Int32
      add headers : JSON::Any
      add session : JSON::Any
    end
  end

  def rollback
    drop table_for(BreezeRequest)
  end
end
