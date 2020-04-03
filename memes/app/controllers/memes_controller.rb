class MemesController < ApplicationController
  # before_action :check_authorization

  def index
       @meme = Meme.search(params).paginate(page: params[:page], per_page: 9)

     # if params[:search]
     #   @meme = Meme.search(params[:search])
     # else
     #    @meme = Meme.paginate(page: params[:page], per_page: 8)
     #  end
    @statisticVoting = Voting.joins(:photo).select("sum(rating) / COUNT(photo_id)  as rating, photo_id as photo_id, meme_id as meme_id").order("rating DESC").group("meme_id")
#    @statisticVoting = Voting.left_outer_joins(photo: :meme).select("sum(rating) / COUNT(photo_id)  as rating, photo_id as photo_id, meme_id as meme_id, title, description, author, meme::image").order("rating DESC").group("meme_id")
#    @statisticVoting = Voting.joins(photo: :meme).select("sum(rating) / COUNT(photo_id)  as rating, photo_id as photo_id, meme_id as meme_id, title, description, author, meme::image").order("rating DESC").group("meme_id")
#    @statisticVoting = Voting.left_outer_joins(photo: :meme).select("sum(rating) / COUNT(photo_id)  as rating, photo_id, meme_id, title, description, author, meme::image").order("rating DESC").group("meme_id")
    # @statisticVoting = Voting.select("count(photo_id) as count_photo_id, sum(rating) as rating, photo_id").group("photo_id")
    # @statisticPhoto = Photo.all

  end

  def about
  end

  def new
    @meme = Meme.new
  end

  def edit
      @meme = Meme.find(params[:id])
  end


  def show
    @meme = Meme.find(params[:id])
  end

  def create
    @meme = Meme.new(meme_params)
    if @meme.save

      redirect_to new_meme_in_path(author: meme_params[:author])
      #redirect_to memes_path, success: 'Create new meme'
    else
      render :new
    end
  end

  def update
    @meme = Meme.find(params[:id])
    if @meme.update(meme_params)
     redirect_to memes_path, success: 'Update success'
    else
      render :edit, danger: 'Update bad'
    end
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy
    redirect_to memes_path, info: 'Delete success'
  end

  private def meme_params
    params.require(:meme).permit(:title, :description, :image, :author)
  end

  # def check_authorization
  #   raise User::NotAuthorization unless current_user.admin?
  # end
end
