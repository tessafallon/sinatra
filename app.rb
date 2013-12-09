<<<<<<< HEAD
require 'sinatra/base'


module StudentSite
  class App < Sinatra::Base
    get '/artists' do
	@artists = ["Matisse", "Man Ray", "Reuben"]
	erb :artists
	end
   end
 end
=======
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
>>>>>>> c57f239f9d3fb528817e0f46c35580953b3a8f6f
