class RolesController < ApplicationController
  def new
    @role = Role.new
  end

  def index
    @role = authorize Role.all
    @user = User.all

  end

  def edit
    @role = authorize Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    # authorize @subject
    if @role.update(role_params)
     redirect_to roles_path
     # , success: 'Update success'
    else
      render :edit
      # , danger: 'Update bad'
    end
  end

  def create
    @role =  authorize Role.new(user_params)
      if @role.save
        redirect_to roles_path
      else
        render :new
      end
  end

  def destroy
    @role = Role.find(params[:id])
    
    authorize @role
    @role.destroy
    redirect_to roles_path
    # , info: 'Delete success'
  end

  private def role_params
    params.require(:role).permit(:create_at, :update_at, :read_at, :delete_at, :admin_at)
  end
end
