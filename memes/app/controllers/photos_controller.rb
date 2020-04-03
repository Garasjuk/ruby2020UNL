class PhotosController < ApplicationController

  def index
    @photo = Photo.all
  end

  def show
    @photo = Photo.find(params[:meme_id])
    #@voting = Voting.find(params[:meme_id])
  end

  def create
    @meme = Meme.find(params[:meme_id])
    @photo = @meme.photo.create(photo_params)
    redirect_to meme_path(@meme)
  end

  def update
    @meme = Meme.find(params[:meme_id])
    @photo = @meme.photo.create(photo_params)
    redirect_to meme_path(@meme)
  end

  def destroy
    @photo = Photo.find(params[:meme_id])
    @photo.destroy
    redirect_to meme_path(@photo.meme_id)
end

  private def photo_params
    params.require(:photo).permit(:image)
  end

end
