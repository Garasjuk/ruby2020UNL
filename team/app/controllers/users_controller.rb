class UsersController < ApplicationController
before_action :authenticate_user!
	def index
		#@command = Command.search(params).paginate(page: params[:page], per_page: 9)
		@user = User.search(params).paginate(page: params[:page], per_page: 12)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:command_id])
		@command = Command.all
	end

	def new
		@user = User.new
		@command = Command.all
	end




	def create

#		render plain: params[:user].inspect
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to commands_path, success: 'Update success'
		else
			render :edit, danger: 'Update bad'
		end
	end

	def destroy
		@user = User.find(params[:command_id])
		@user.destroy
		redirect_to command_path(params[:id]), info: 'Delete success'
	end


	def user_params
      params.require(:user).permit(:name, :phone, :male, :command_id, :password)
    end
end
