class Breeze::Requests::Index < BreezeAction
  include Auth::AllowGuests

  get "/breeze" do
    pages, records = paginate(BreezeRequestQuery.new.created_at.desc_order)
    html IndexPage, breeze_requests: records, pages: pages
  end
end
