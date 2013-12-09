require 'sinatra/base'


module StudentSite
  class App < Sinatra::Base
    get '/hello-world'do
    erb :hello
	 end
    get '/artists' do
	@artists = ["Matisse", "Man Ray", "Reuben"]
	erb :artists
	end
   end
 end