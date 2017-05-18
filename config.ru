require_relative 'main'

configure do
  require 'redis'
  uri = URI.parse(ENV["REDISTOGO_URL"])
  puts "somethingsomethingsomething"
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

run Sinatra::Application
