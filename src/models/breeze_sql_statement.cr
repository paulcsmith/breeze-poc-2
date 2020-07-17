class BreezeSqlStatement < BaseModel
  table do
    column statement : String
    column args : String?
    belongs_to breeze_request : BreezeRequest?
  end
end
