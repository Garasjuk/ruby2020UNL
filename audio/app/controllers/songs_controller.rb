class SongsController < ApplicationController
  def index
    @song = Song.all
  end

  def new
    @albom = params[:albom_id]
    @song = Song.new

  end

  def edit
    @song = Song.find(params[:albom_id])
  end

  def show
    # @albom = Albom.where(id: params[:id])
    @albom = Albom.find(params[:id])
    @song = Song.where(albom_id: params[:id])

  end

  def update
    @song = Song.find(params[:albom_id])
    if @song.update(audio_params)
      redirect_to albom_path(@song.albom_id)
    else
      render 'new'
    end
  end

  def create
    Song.transaction do
     @song = Song.new(audio_params)
     if @song.save
       redirect_to albom_path(@song.albom_id)
     else
        render 'new'
     end
   end
  end

  def destroy
    Song.transaction do
      @song = Song.find(params[:albom_id])
      @song.destroy
    end
    redirect_to albom_path(params[:id])
  end

  private def audio_params
      params.require(:song).permit(:name, :podcast, :albom_id)
  end
end
