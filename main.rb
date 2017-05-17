require 'sinatra'
require 'redis'

begin
  encoded_url = URI.encode(ENV["REDISTOGO_URL"].to_s)
  uri = URI.parse(encoded_url)
  redis = Redis.new(
    :host => 'no',
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
