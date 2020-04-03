class VotingsController < ApplicationController


  def index
    @voting = Voting.all
  end

  def show
    @voting = Voting.find(params[:id])
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @voting = @photo.voting.create(voting_params)
    redirect_to meme_path(@photo.meme_id)
  end

  # def update
  #   @photo = Photo.find(params[:photo_id])
  #   @voting = @photo.voting.create(voting_params)
  #   redirect_to memes_path
  # end

  private def voting_params
    params.require(:voting).permit(:rating)
  end
end
