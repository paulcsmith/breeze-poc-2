class BreezePipe < BaseModel
  table do
    column name : String
    belongs_to breeze_request : BreezeRequest
  end
end
