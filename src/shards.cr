# Load .env file before any other config or app code
require "dotenv"
Dotenv.load?

abstract class Pulsar::Event
  getter :created_at

  macro inherited
    @created_at = Time.utc
    class_property subscribers = [] of Proc(self, Nil)
  end

  def self.subscribe(proc)
    self.subscribers << proc
  end

  def publish
    self.class.subscribers.each do |s|
      s.call(self)
    end
  end

  abstract def name : String
end

class AvramQueryEvent < Pulsar::Event
  property :query

  def initialize(@query : String)
  end

  def name : String
    "avram.query"
  end
end

AvramQueryEvent.subscribe ->(event : AvramQueryEvent) { puts event.inspect }
AvramQueryEvent.new(query: "foo").publish

# Require your shards here
require "avram"
require "lucky"
require "carbon"
require "authentic"
require "jwt"
