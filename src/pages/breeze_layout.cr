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

      body do
        tailwind_stacked
      end
    end
  end

  def tailwind_stacked
    div "@keydown.window.escape": "sidebarOpen = false", x_data: "{ sidebarOpen: false }" do
      div class: "bg-gray-800 pb-32" do
        nav class: "bg-gray-800" do
          div class: "max-w-7xl mx-auto sm:px-6 lg:px-8" do
            div class: "border-b border-gray-700" do
              div class: "flex items-center justify-between h-16 px-4 sm:px-0" do
                div class: "flex items-center" do
                  div class: "hidden md:block" do
                    div class: "flex items-baseline" do
                      a "Dashboard", class: "px-3 py-2 rounded-md text-sm font-medium text-white bg-gray-900 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Team", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Projects", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Calendar", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Reports", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                    end
                  end
                end
                hamburger_menu
              end
            end
          end

          m Breeze::SmallSidebar
        end
        header class: "py-10" do
          div class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
            h1 class: "text-3xl leading-9 font-bold text-white" do
              render_if_defined(:breadcrumb_parent)
              text page_title
            end
          end
        end
      end
      main class: "-mt-32" do
        div class: "max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8" do
          div class: "bg-white rounded-lg shadow overflow-hidden" do
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

  def tailwind
    div "@keydown.window.escape": "sidebarOpen = false", class: "h-screen flex overflow-hidden bg-gray-100", x_data: "{ sidebarOpen: false }" do
      m Breeze::SmallSidebar
      m Breeze::MediumSidebar
      div class: "flex flex-col w-0 flex-1 overflow-hidden" do
        div class: "md:hidden pl-1 pt-1 sm:pl-3 sm:pt-3" do
          button "@click.stop": "sidebarOpen = true", class: "-ml-0.5 -mt-0.5 h-12 w-12 inline-flex items-center justify-center rounded-md text-gray-500 hover:text-gray-900 focus:outline-none focus:bg-gray-200 transition ease-in-out duration-150" do
            tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
              tag "path", d: "M4 6h16M4 12h16M4 18h16", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
            end
          end
        end
        main class: "flex-1 relative z-0 overflow-y-auto pt-2 pb-6 focus:outline-none md:py-6", tabindex: "0", x_data: "", x_init: "$el.focus()" do
          div class: "max-w-7xl mx-auto px-4 sm:px-6 md:px-8" do
            h1 class: "ml-5 mb-1 text-2xl font-semibold text-gray-900" do
              render_if_defined(:breadcrumb_parent)
              text page_title
            end
          end
          div class: "max-w-7xl mx-auto px-4 sm:px-6 md:px-8" do
            div class: "py-4" do
              m Shared::FlashMessages, @context.flash
              content
            end
          end
        end
      end
    end
  end
end
