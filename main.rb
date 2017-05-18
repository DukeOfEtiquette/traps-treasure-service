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

  result = REDIS.get("foo")
  pusher_client.trigger('my-channel', 'my-event', {
    message: "#{result}"
  })

  message = "hello"
  name = "world!"
  "#{message} #{name} #{result}"
end

get '/:id' do
  pusher_client.trigger('my-channel', 'my-event', {
    message: "#{params['id']}"
  })

  "Sending #{params['id']}"
end
