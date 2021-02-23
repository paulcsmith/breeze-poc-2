require "./browser_action"

abstract class BreezeAction < Lucky::Action
  include Lucky::ProtectFromForgery
  include Lucky::Paginator::BackendHelpers
  accepted_formats [:html]
end
