require 'sinatra'
require 'redis'

begin
  uri = URI.parse(ENV["REDISTOGO_URL"])
  redis = Redis.new(
    :host => "no",
    :port => uri.port,
    :password => uri.password
  )
  puts redis.info
  client_ping = redis.ping
  if client_ping
    puts 'Connected!'
  else
    raise 'Ping failed'
  end
rescue => e
  puts "Error: #{e}"
end

get '/' do
  message = "hello"
  name = "world!"
  "#{message} #{name}"
end
