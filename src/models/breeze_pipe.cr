class BreezePipe < BaseModel
  table do
    column name : String
    column continued : Bool
    belongs_to breeze_request : BreezeRequest
  end
end
