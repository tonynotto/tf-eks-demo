require 'sinatra'
require 'sinatra/json'

get '/' do
  json({
    'message' => 'Automate all the things!',
    'timestamp' => request_timestamp
  })
end

def request_timestamp
  Time.now.to_i
end
