class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/new' do
    erb :'/genres/new'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  post '/genres' do
    @genre = Genre.create(name: params["Name"])
    @genre.song = Song.find_or_create_by(name: params["Song Name"])
    @genre.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @genre.save

    flash[:message] = "Successfully created genre."
    redirect "/genres/#{@genre.slug}"
  end
end
