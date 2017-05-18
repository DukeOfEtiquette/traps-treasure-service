require 'sinatra'
require 'pusher'

pusher_client = Pusher::Client.new(
  app_id: '341330',
  key: '338b7804d638b00a56a2',
  secret: 'd7679d74e250f43ff196',
  cluster: 'us2',
  encrypted: true
)

get '/' do

  pusher_client.trigger('my-channel', 'my-event', {
    message: 'hello world'
  })

  message = "hello"
  name = "world!"
  result = REDIS.get("foo")
  "#{message} #{name} #{result}"
end
