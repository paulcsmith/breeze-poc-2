class Breeze::Requests::Show < BreezeAction
  include Auth::AllowGuests

  route do
    html ShowPage, breeze_request: BreezeRequestQuery.find(request_id)
  end
end
