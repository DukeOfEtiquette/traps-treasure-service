require 'sinatra'
require 'redis'

get '/' do
  redisURL = Redis.new(url: ENV["REDIS_URL"])
  message = "hello"
  name = "world!"
  "#{message} #{name} #{redisURL}"
end
