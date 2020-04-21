class CommandsController < ApplicationController
before_action :authenticate_user!
	def index
		#@command = Command.search(params).paginate(page: params[:page], per_page: 9)
		@command = Command.search(params).paginate(page: params[:page], per_page: 9)
	end

	def show
		@command = Command.find(params[:id])
	end

	def edit
		@command = Command.find(params[:id])
	end

	def new
		@command = Command.new
	end

	def create
		@command = Command.new(command_params)
		if @command.save
			redirect_to commands_path, success: 'Create new meme'
		#redirect_to memes_path,
		else
			render :new
		end
	end

	def update
		@command = Command.find(params[:id])
		if @command.update(command_params)
			redirect_to commands_path, success: 'Update success'
		else
			render :edit, danger: 'Update bad'
		end
	end

	def destroy
		@command = Command.find(params[:id])
		@command.destroy
		redirect_to commands_path, info: 'Delete success'
	end


	private def command_params
		params.require(:command).permit(:name, :region)
	end

end
