class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def index
    @user = authorize User.all
  end

  def show
    @user = User.find(params[:id])

    # @role = Role.joins(user: :role).select("create_at, update_at, read_at, delete_at, admin_at").where("user.id = 'params[:id]'")
    @role = Role.find(@user.role_id)
  end

  def edit
    @user = authorize User.find(params[:id])
  end

  def create
    # render plain: params[:user].inspect

    @role = Role.last
    @user =  User.new(user_params.merge(role_id: @role.id ))
      if @user.save
        redirect_to log_in_url
      else
        render :new
      end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to users_path
    # , info: 'Delete success'
  end




  private def user_params
    params.require(:user).permit(:username, :password)
  end

end
