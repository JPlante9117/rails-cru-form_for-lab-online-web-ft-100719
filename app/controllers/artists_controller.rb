class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(strong_param)
        redirect_to artist_path(@artist)
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(strong_param)
        redirect_to artist_path(@artist)
    end

    def show
        @artist = Artist.find(params[:id])
    end

    private

    def strong_param
        params.require(:artist).permit(:name, :bio)
    end

end
