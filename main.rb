require 'sinatra'
require 'pusher'



get '/' do

  pusher_client.trigger('my-channel', 'my-event', {
    message: 'hello world'
  })

  message = "hello"
  name = "world!"
  result = REDIS.get("foo")
  "#{message} #{name} #{result}"
end
