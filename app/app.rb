require 'sinatra/base'
require_relative './models/link.rb'

class Bookmark_manager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

end
