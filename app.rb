require 'sinatra'
require_relative 'TwitterClient.rb'

get '/' do
  'under construction'
end

get '/tweet' do
  TwitterClient.new.update('Hello, heroku.')
end

get '/wakeup' do
  TwitterClient.new.update('Goodmorning, heroku.')
end

get '/hoge' do
  'hogehoge'
end
