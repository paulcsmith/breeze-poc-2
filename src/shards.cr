# Load .env file before any other config or app code
require "dotenv"
Dotenv.load?

# Require your shards here
require "pulsar"

class Avram::QueryEvent < Pulsar::Event
  property :query, :args

  def initialize(@query : String, @args : String?)
  end
end

require "avram"
require "lucky"
require "carbon"
require "authentic"
require "jwt"
