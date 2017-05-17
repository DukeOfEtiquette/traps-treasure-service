require 'sinatra'

get '/' do
  message = "hello"
  name = "world!"
  "#{message} #{name}"
end
