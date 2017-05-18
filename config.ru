require_relative 'main'

configure do
  require 'pusher'
  pusher_client = Pusher::Client.new(
    app_id: '341330',
    key: '338b7804d638b00a56a2',
    secret: 'd7679d74e250f43ff196',
    cluster: 'us2',
    encrypted: true
  )

  require 'redis'
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  REDIS.set("foo", 10)
end

run Sinatra::Application
