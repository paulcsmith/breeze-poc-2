require "./browser_action"

abstract class BreezeAction < Lucky::Action
  include Lucky::Paginator::BackendHelpers
  accepted_formats [:html]
end
