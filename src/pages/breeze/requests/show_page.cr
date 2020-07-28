class Breeze::Requests::ShowPage < BreezeLayout
  needs breeze_request : BreezeRequest

  def page_title : String
    "Request Details"
  end

  def req : BreezeRequest
    breeze_request
  end

  def breadcrumb_parent
    link "All Requests", to: Index, class: "border-b-2 border-green-400 hover:text-teal-700"
    m ArrowSvg, "mx-1 mb-1 h-5 w-5 text-gray-400 inline-block"
  end

  def content
    div class: "w-2/3" do
      m Breeze::Panel do
        m Breeze::DescriptionList,
          heading_title: ->{
            m Breeze::Badge, req, large: true
            span class: "ml-3 font-normal text-base text-blue-800" do
              text "about #{time_ago_in_words(req.created_at)} ago"
            end
          },
          list: ->{
            m Breeze::DescriptionListRow, "Action", req.action
            req.breeze_response.try do |resp|
              m Breeze::DescriptionListRow, "Response Status", "#{resp.status.to_s} #{Wordsmith::Inflector.humanize(HTTP::Status.from_value?(resp.status))}"
            end
            m Breeze::DescriptionListRow, "Request Body", req.body || "No body"
            m Breeze::DescriptionListRow, "Request Params", req.parsed_params || "No params"
          }
      end
    end

    m Breeze::Panel do
      m Breeze::DescriptionList,
        heading_title: ->{ text "Session" },
        list: ->{
          render_session_info
        }
    end

    m Breeze::Panel do
      m Breeze::DescriptionList,
        heading_title: ->{ text "Queries" },
        list: ->{
          if req.breeze_sql_statements.any?
            req.breeze_sql_statements.each do |query|
              m Breeze::DescriptionListRow, "Foo", query.statement
            end
          else
            para "No queries", class: "text-center text-gray-500 px-10 py-8 max-x-sm"
          end
        }
    end

    m Breeze::Panel do
      m Breeze::DescriptionList,
        heading_title: ->{ text "Pipes" },
        list: ->{
          req.breeze_pipes.each do |pipe|
            m Breeze::DescriptionListRow, "Foo", pipe.name
          end
        }
    end

    m Breeze::Panel do
      m Breeze::DescriptionList,
        heading_title: ->{ text "Header" },
        list: ->{
          render_header_info
        }
    end
  end

  def render_session_info
    req.session.as_h.each do |key, value|
      m Breeze::DescriptionListRow, "Session #{key}", value.as_s
    end
  end

  def render_header_info
    req.headers.as_h.each do |key, value|
      m Breeze::DescriptionListRow, "Header #{key}", value[0].as_s
    end
  end
end
