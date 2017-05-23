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
  pusher_client.trigger('movements', 'my-event', {
    message: "#{result}"
  })

  message = "hello"
  name = "ellie!"
  "#{message} #{name} #{result}"
end

get '/:id/move/:new_loc' do
  pusher_client.trigger('movements', 'player-move', {
    new_location: "#{params['new_loc']}",
    player_id: "#{params['id']}"
  })

  "Sending #{params['new_loc']}"
end
