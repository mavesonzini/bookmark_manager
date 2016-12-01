ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark_manager < Sinatra::Base

  get '/links/new' do
    erb(:'links/new')
  end

  get '/links' do
    @links = Link.all
    erb(:'links/links')
  end

  post '/links' do
    link = Link.new(:title => params[:title], :url => params[:url])
    tag = Tag.first_or_create(:name => params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @tag = params[:tag]
    @links = Link.all(:url => "bob")
    # require'pry';binding.pry
    erb(:'links/tags')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
