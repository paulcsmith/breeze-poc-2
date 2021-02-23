abstract class BaseComponent < Lucky::BaseComponent
  include Lucky::UrlHelpers

  alias HtmlProc = Proc(IO::Memory) | Proc(Nil)
end
