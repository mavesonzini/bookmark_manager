ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require_relative './models/link'
require './app/data_mapper_setup'


class Bookmark < Sinatra::Base
  enable :sessions

  get '/' do

  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/links'
  end

  get '/links' do
    @link = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], name: params[:name])
    params[:tags].split(", ").each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  get '/tags/:name' do
    @tag = Tag.first(name: params[:name])
    @links = @tag ? @tag.links : []
    erb :'/links/filtered_links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
