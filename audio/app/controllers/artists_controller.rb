class ArtistsController < ApplicationController


    def index
      @artist = Artist.all
    end

    def new
      @group = params[:group_id]
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
      if @artist.update(project_params)
        redirect_to group_path(@artist.group_id)
      else
        render 'new'
      end
    end

    def destroy
      Artist.transaction do
        @artist = Artist.find(params[:id])
        @artist.destroy
      end
        redirect_to group_path(@artist.group_id)
    end

    def create
      #render plain: params[:artist].inspect
      Artist.transaction do
        @artist = Artist.new(project_params)
        if @artist.save
          redirect_to group_path(@artist.group_id)
        else
          render 'new'
        end
      end
    end

    private def project_params
        params.require(:artist).permit(:name, :description, :image, :group_id)
    end


end
