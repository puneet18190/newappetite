class TracksController < ApplicationController
  def index
    @playlist = Playlist.find(params[:playlist_id])
    @tracks = @playlist.tracks
  end

  def new
    @track = Track.new
  end

  def create
    @track = Playlist.find(params[:playlist_id]).tracks.new(:title => params[:track][:title], :artist => params[:track][:artist], :url=> params[:track][:url])

    respond_to do |format|
      if @track.save
        format.html { redirect_to playlist_tracks_path(params[:playlist_id]), notice: 'Track was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
end