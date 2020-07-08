require "./browser_action"

abstract class BreezeAction < BrowserAction
  skip :store_breeze
end
