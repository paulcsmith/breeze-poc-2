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
    div do
      div class: "bg-gray-800 pb-32" do
        nav class: "bg-gray-800" do
          div class: "max-w-7xl mx-auto sm:px-6 lg:px-8" do
            div class: "border-b border-gray-700" do
              div class: "flex items-center justify-between h-16 px-4 sm:px-0" do
                div class: "flex items-center" do
                  div class: "flex-shrink-0" do
                    img alt: "Workflow logo", class: "h-8 w-8", src: "https://tailwindui.com/img/logos/workflow-mark-on-dark.svg"
                  end
                  div class: "hidden md:block" do
                    div class: "ml-10 flex items-baseline" do
                      a "Dashboard", class: "px-3 py-2 rounded-md text-sm font-medium text-white bg-gray-900 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Team", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Projects", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Calendar", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                      a "Reports", class: "ml-4 px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
                    end
                  end
                end
                div class: "hidden md:block" do
                  div class: "ml-4 flex items-center md:ml-6" do
                    button aria_label: "Notifications", class: "p-1 border-2 border-transparent text-gray-400 rounded-full hover:text-white focus:outline-none focus:text-white focus:bg-gray-700" do
                      tag "svg", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                        tag "path", d: "M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                      end
                    end

                    div class: "ml-3 relative" do
                      div do
                        button aria_haspopup: "true", aria_label: "User menu", class: "max-w-xs flex items-center text-sm rounded-full text-white focus:outline-none focus:shadow-solid", id: "user-menu" do
                          img alt: "", class: "h-8 w-8 rounded-full", src: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        end
                      end
                      div class: "origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg" do
                        div class: "py-1 rounded-md bg-white shadow-xs" do
                          a "Your Profile", class: "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100", href: "#"
                          a "Settings", class: "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100", href: "#"
                          a "Sign out", class: "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100", href: "#"
                        end
                      end
                    end
                  end
                end
                div class: "-mr-2 flex md:hidden" do
                  button class: "inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:bg-gray-700 focus:text-white" do
                    tag "svg", class: "block h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                      tag "path", d: "M4 6h16M4 12h16M4 18h16", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                    end
                    tag "svg", class: "hidden h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24" do
                      tag "path", d: "M6 18L18 6M6 6l12 12", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                    end
                  end
                end
              end
            end
          end

          div class: "hidden border-b border-gray-700 md:hidden" do
            div class: "px-2 py-3 sm:px-3" do
              a "Dashboard", class: "block px-3 py-2 rounded-md text-base font-medium text-white bg-gray-900 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
              a "Team", class: "mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
              a "Projects", class: "mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
              a "Calendar", class: "mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
              a "Reports", class: "mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#"
            end
            div class: "pt-4 pb-3 border-t border-gray-700" do
              div class: "flex items-center px-5" do
                div class: "flex-shrink-0" do
                  img alt: "", class: "h-10 w-10 rounded-full", src: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                end
                div class: "ml-3" do
                  div "Tom Cook", class: "text-base font-medium leading-none text-white"
                  div "tom@example.com", class: "mt-1 text-sm font-medium leading-none text-gray-400"
                end
              end
              div aria_labelledby: "user-menu", aria_orientation: "vertical", class: "mt-3 px-2", role: "menu" do
                a "Your Profile", class: "block px-3 py-2 rounded-md text-base font-medium text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#", role: "menuitem"
                a "Settings", class: "mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#", role: "menuitem"
                a "Sign out", class: "mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700", href: "#", role: "menuitem"
              end
            end
          end
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
          div class: "bg-white rounded-lg shadow" do
            m Shared::FlashMessages, @context.flash
            content
            # div class: "border-4 border-dashed border-gray-200 rounded-lg h-96" do
            # end
          end
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
