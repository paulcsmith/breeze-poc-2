class BreezeRequest < BaseModel
  table do
    column path : String
    column method : String
    column action : String
    column body : String?
    column session : JSON::Any
    column headers : JSON::Any
    has_one breeze_response : BreezeResponse?
  end

  def method : String
    previous_def.upcase
  end
end
