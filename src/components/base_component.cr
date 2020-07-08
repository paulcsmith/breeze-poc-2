abstract class BaseComponent < Lucky::BaseComponent
  alias HtmlProc = Proc(IO::Memory) | Proc(Nil)
end
