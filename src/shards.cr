# Load .env file before any other config or app code
require "dotenv"
Dotenv.load?

abstract class Pulsar::Event
  getter :started_at

  macro inherited
    @started_at : Time = Time.utc
    @finished_at  : Time?
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

class Avram::QueryEvent < Pulsar::Event
  property :query, :args

  def initialize(@query : String, @args : String?)
  end

  def name : String
    "avram.query"
  end
end

class Lucky::RequestStartedEvent < Pulsar::Event
  property :request

  def initialize(@request : HTTP::Server::Request)
  end

  def name : String
    "lucky.request.started"
  end
end

class Lucky::Requst
end

# Require your shards here
require "avram"
require "lucky"
require "carbon"
require "authentic"
require "jwt"
