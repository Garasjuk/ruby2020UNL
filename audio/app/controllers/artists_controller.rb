class ArtistsController < ApplicationController


    def index
      @artist = Artist.all
    end

    def new
      @artist = Artist.new
    end

    def edit
      @artist = Artist.find(params[:id])
    end

    def show
      @artist = Artist.where(id: params[:id])


    end

    def update
      @artist = Artist.find(params[:id])
      if @artist.update()
        redirect_to artist_path
      else
        render 'new'
      end
    end

    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        redirect_to artist_path
    end

    def create
      @artist = Artist.new(project_params)
      if @artist.save
        redirect_to @artist
      else
        render 'new'
      end
    end

    private def project_params
        params.require(:artist).permit(:name, :description, :image)
    end


end
