class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/new' do
    erb :'/artists/new'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  post '/artists' do
    @artist = Artist.create(name: params["Name"])
    @artist.song = Song.find_or_create_by(name: params["Song Name"])
    @artist.genre_ids = params[:genres]
    @artist.save

    flash[:message] = "Successfully created artist."
    redirect "/artists/#{@artist.slug}"
  end
end
