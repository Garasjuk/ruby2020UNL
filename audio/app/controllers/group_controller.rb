class GroupController < ApplicationController
  def index

    @group = Group.all
    # @group = Group.joins(:photo).select("sum(rating) / COUNT(photo_id)  as rating, photo_id as photo_id, meme_id as meme_id").order("rating DESC").group("meme_id")
#
  end
  def new
    @group = Group.new
  end
  def edit
    @group = Group.find(params[:id])
  end
  def show
    @group = Group.find(params[:id])
    @artist = Artist.where(group_id: params[:id])
    @albom = Albom.joins(:gener).select("alboms.id as aid, alboms.name as aname, alboms.description, alboms.image, geners.name").where(group_id: params[:id])
    # @albom = Albom.where(group_id: params[:id])
    # @gener = Gener.joins(:alboms).where(group_id: params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update()
      redirect_to group_path
    else
      render 'new'
    end
  end

  def destroy
      @group = Group.find(params[:id])
      @group.destroy
      redirect_to group_path
  end

  def create
    @group = Group.new(project_params)
    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  private def project_params
			params.require(:group).permit(:name, :description, :image)
	end
end
