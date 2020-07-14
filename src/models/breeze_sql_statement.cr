class BreezeSqlStatement < BaseModel
  table do
    column statement : String
    column args : String?
  end
end
