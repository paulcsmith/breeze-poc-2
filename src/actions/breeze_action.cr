require "./browser_action"

abstract class BreezeAction < BrowserAction
  skip :store_breeze_request
  skip :store_breeze_response
end
