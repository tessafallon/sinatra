require 'bundler'
Bundler.require

class TestApp < Sinatra::Application

get '/hello-world' do
	erb :hello
end

get '/artists' do
@artists = ["Matisse", "Man Ray", "Reuben"]
	erb :artists
end
end