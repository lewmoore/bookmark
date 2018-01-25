ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'



class Bookmark_manager < Sinatra::Base

  before do
    @current_user = User.first
  end

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    # @current_user = User.first
    erb :links
  end

  post '/new_user' do
    User.create(username: params[:username], password: params[:password])
    session['user'] = User.first
    redirect '/links'
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
