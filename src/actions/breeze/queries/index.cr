class Breeze::Queries::Index < BreezeAction
  get "/breeze/queries" do
    pages, records = paginate(BreezeSqlStatementQuery.new.created_at.desc_order)
    html IndexPage, breeze_queries: records, pages: pages
  end
end
