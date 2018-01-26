ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'



class Bookmark_manager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/new_user' do
    user = User.create(username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.id == nil
      redirect '/'
    else
      redirect '/links'
    end
  end

  post '/links' do
    link = Link.first_or_create(url: params[:url], title: params[:title])
    Tag.multi_tag(params[:tags], link)
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

end
