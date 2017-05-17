require 'sinatra'
require 'redis'

get '/' do
  redisURL = ENV['REDISTOGO_URL']
  message = "hello"
  name = "world!"
  "#{message} #{name} #{redisURL}"
end
