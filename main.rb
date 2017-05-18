require 'sinatra'

get '/' do
  message = "hello"
  name = "world!"
  result = REDIS.get("foo")
  "#{message} #{name} #{result}"
end
