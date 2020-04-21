class UsersController < ApplicationController
   before_action :authenticate_user!
  # http_basic_authenticate_with name before_filter :authenticate_user!

  def index
       @user = User.paginate(page: params[:page], per_page: 12)
  end

  def new
      @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def friend
    @friend = Friend.paginate(page: params[:page], per_page: 12)

  end
  def neutrality
    @neutrality = Neutrality.paginate(page: params[:page], per_page: 12)
  end

  def enemy
    @enemy = Enemy.paginate(page: params[:page], per_page: 12)
  end

  def update
    if params[:neutrality]
      ServiceLog.new(neutrality_params).userUpdate
    elsif params[:friend]
      ServiceLog.new(friend_params).userUpdate
    elsif params[:enemy]
      ServiceLog.new(enemy_params).userUpdate
    else
    end
    redirect_to users_path
        # render plain: params[:neutrality].inspect
  end

  def create
#    User.transaction do
    ServiceLog.new(user_params).userCreate
#   if @user.save
       redirect_to users_path
#     else
#        render 'new'
#     end
  end

  def destroy
      #render plain: params[:user].inspect
      ServiceDel.new(params[:id]).userDestroy
      redirect_to users_path
  end

  private def people_params
    params.require(:user).permit(:id, :name, :name_before, :type, :type_before)
  end
  def neutrality_params
    params.require(:neutrality).permit(:id, :name, :name_before, :type, :type_before)
  end
  def friend_params
    params.require(:friend).permit(:id, :name, :name_before, :type, :type_before)
  end
  def enemy_params
    params.require(:enemy).permit(:id, :name, :name_before, :type, :type_before)
  end

  def user_params
    params.require(:user).permit(:name, :type)
  end


end
