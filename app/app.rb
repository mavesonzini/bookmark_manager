ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require_relative './models/link'
require './app/data_mapper_setup'


class Bookmark < Sinatra::Base

  get '/' do

  end

  get '/links' do
    @link = Link.all
    erb :'links/link2'
  end

  post '/links' do
    link = Link.new(url: params[:url], name: params[:name])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  get '/tags/:name' do
    @tag = Tag.first(name: params[:tag])
    @links = @tag ? @tag.links : []
    erb :'/links/filtered_links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
