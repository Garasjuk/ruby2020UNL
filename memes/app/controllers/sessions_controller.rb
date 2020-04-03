class SessionsController < ApplicationController

  def new
  end

  def create
    session[:name] = params[:author]
    redirect_to memes_path, success: 'Create new meme'
  end

  def destroy
    session[:name] = nil
    redirect_to memes_path
  end
end
