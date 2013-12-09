require 'sinatra/base'


module StudentSite
  class App < Sinatra::Base
    get '/artists' do
	@artists = ["Matisse", "Man Ray", "Reuben"]
	erb :artists
	end
   end
 end