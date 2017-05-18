require_relative 'main'

configure do

  require 'redis'
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  REDIS.set("foo", 10)
end

run Sinatra::Application
