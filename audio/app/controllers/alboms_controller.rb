class AlbomsController < ApplicationController

  def index
    @albom = Albom.all
  end

  def new
    @group = params[:group_id]
    @albom = Albom.new
    @gener = Gener.all
    @albom.songs.build
  end

  def edit
    @albom = Albom.find(params[:id])
  end

  def show
    # @albom = Albom.where(id: params[:id])
    @albom = Albom.find(params[:id])
    @song = Song.where(albom_id: params[:id])

  end

  def update
    @albom = Albom.find(params[:id])
    if @albom.update(audio_params)
      redirect_to group_path(@albom.group_id)
    else
      render 'new'
    end
  end

  def destroy
      #render plain: params[:id].inspect
      Song.where(:albom_id => params[:id]).destroy_all
      @albom = Albom.find(params[:id])
      @albom.destroy
      redirect_to group_path(@albom.group_id)

  end

  def create
    Albom.transaction do
     @albom = Albom.new(audio_params)
   if @albom.save
       redirect_to group_path(params[:group_id])
     else
        render 'new'
     end
   end
  end

  private def audio_params
      params.require(:albom).permit(:name, :description, :image, :group_id, :artist_id, :gener_id, songs_attributes: [:name])
  end

end
