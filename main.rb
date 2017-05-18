require 'sinatra'

get '/' do
  message = "hello"
  name = "world!"
  REDIS.set("answer", 42)
  result = REDIS.get("answer")
  "#{message} #{name} #{result}"
end
