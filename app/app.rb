ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'


class Bookmark_manager < Sinatra::Base
enable :sessions

  get '/links/new' do
    erb(:'links/new')
  end

  get '/links' do
    @links = Link.all
    @user_email = current_user ? current_user.email : ""
    erb(:'links/links')
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tag].split(", ").each do |tag|
    link.tags << Tag.first_or_create(name: tag)
  end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb (:'links/links')
  end

  get '/links/signup' do
    erb (:'links/signup')
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
