class Breeze::Queries::ShowPage < BreezeLayout
  needs breeze_sql_statement : BreezeSqlStatement

  def page_title : String
    "Breeze Query"
  end

  def content
    m Breeze::Panel do
      m Breeze::DescriptionList,
        heading_title: ->{ text "Query details" },
        list: ->{
          m Breeze::DescriptionListRow, "Statement", breeze_sql_statement.statement
          m Breeze::DescriptionListRow, "Args", breeze_sql_statement.args || "[]"
        }
    end
  end
end
