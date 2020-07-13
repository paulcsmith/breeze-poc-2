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
    m Breeze::DescriptionList,
      heading_title: ->{ text req.action },
      heading_subtitle: ->{ m Breeze::Badge, req },
      list: ->{
        m Breeze::DescriptionListRow, "Status", req.status.to_s
        render_session_info
        render_header_info
      }
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
