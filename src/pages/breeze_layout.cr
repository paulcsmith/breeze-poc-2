abstract class BreezeLayout
  include Lucky::HTMLPage

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User?

  abstract def content
  abstract def page_title : String

  def render
    html_doctype

    html lang: "en" do
      m Breeze::LayoutHead, page_title: page_title, context: @context

      body class: "bg-gray-100" do
        tailwind_stacked
      end
    end
  end

  def tailwind_stacked
    div "@keydown.window.escape": "sidebarOpen = false", x_data: "{ sidebarOpen: false }" do
      div class: "bg-gray-800 pb-32 pt-5" do
        nav class: "bg-gray-800" do
          div class: "max-w-7xl mx-auto sm:px-6 lg:px-8" do
            div class: "flex items-center justify-between h-16 px-4 sm:px-0" do
              div class: "flex items-center" do
                div class: "hidden md:block" do
                  div class: "flex items-baseline" do
                    m Breeze::SidebarLinks, context: context
                  end
                end
                hamburger_menu
              end
            end
          end

          m Breeze::SmallSidebar, context: context
        end
      end
      main class: "-mt-32" do
        div class: "max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8" do
          div class: "mt-7 bg-white rounded-lg shadow-lg overflow-hidden" do
            m Shared::FlashMessages, @context.flash
            content
          end
        end
      end
    end
  end

  def hamburger_menu
    div class: "-mr-2 flex md:hidden" do
      button "@click.stop": "sidebarOpen = !sidebarOpen", class: "inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:bg-gray-700 focus:text-white" do
        tag "svg", x_show: "!sidebarOpen", class: "block h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
          tag "path", d: "M4 6h16M4 12h16M4 18h16", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
        end
        tag "svg", x_show: "sidebarOpen", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
          tag "path", d: "M6 18L18 6M6 6l12 12", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
        end
      end
    end
  end
end
