class ApplicationController < ActionController::Base

  include Pundit

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
    # @current_user ||= User.joins(user: :role).select("username, admin").where("user.id = 'session[:id]'" ) if session[:id]
    # @current_user ||= User.joins("INNER JOIN role ON role.id = user.role_id AND user.id 'session[:id]'")   if session[:id]
    # @role_user ||= Role.find(session[:role]) if session[:role]
  end

  protected def authenticate_user!
       unless current_user
       store_location_for(:user, request.url)
       redirect_to new_session_url
     end
   end


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private def user_not_authorized
    flash[:warning] = "You do not have sufficient privileges to complete this action."
      redirect_to(request.referrer || root_path)
  end
end
