class SessionsController < ApplicationController

  def create
	  user = User.authenticate(params[:name], params[:password])
	  if user
		session[:id] = user.id
		redirect_to users_url, :notice => "Logged in!"
	  else
		flash.now.alert = "Invalid first_name or password"
		render 'new'
	  end
	end

	def destroy
		session[:id] = nil
		redirect_to root_url, :notice => "Logged out!"

	end

end
