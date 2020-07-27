class Breeze::Requests::Show < BreezeAction
  include Auth::AllowGuests

  get "/breeze/requests/:request_id" do
    requests = BreezeRequestQuery.new
      .preload_breeze_response
      .preload_breeze_sql_statements
      .find(request_id)
    html ShowPage, breeze_request: requests
  end
end
