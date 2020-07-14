class Breeze::SidebarLinks < BaseComponent
  def render
    link "Requests", to: Breeze::Requests::Index, class: "#{link_class} #{link_active_class}"
    a "Emails", href: "#", class: "#{link_class} #{link_inactive_class}"
  end

  def link_class
    "block px-3 py-2 mr-3 rounded-md text-base font-medium focus:outline-none focus:text-white focus:bg-gray-700"
  end

  def link_inactive_class
    "text-gray-300 hover:text-white hover:bg-gray-700"
  end

  def link_active_class
    "bg-gray-900 text-white"
  end
end
