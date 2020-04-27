class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:username], params[:password])
    # role = Role.find(user.role_id)
    if user
    session[:id] = user.id
    # session[:role] = role.id
    redirect_to subjects_path, :notice => "Logged in!"
    else
    flash.now.alert = "Invalid first_name or password"
    render 'new'
    end
  end

  def destroy
    session[:id] = nil
    # session[:role] = nil
    redirect_to root_url, :notice => "Logged out!"

  end

end
