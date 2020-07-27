class Breeze::Requests::Show < BreezeAction
  get "/breeze/requests/:request_id" do
    requests = BreezeRequestQuery.new
      .preload_breeze_response
      .preload_breeze_sql_statements
      .preload_breeze_pipes
      .find(request_id)
    html ShowPage, breeze_request: requests
  end
end
