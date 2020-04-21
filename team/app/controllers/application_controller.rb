class ApplicationController < ActionController::Base

  helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(session[:id]) if session[:id]
	end



  protected def authenticate_user!
     unless current_user
     store_location_for(:user, request.url)
     redirect_to new_session_url
   end
 end
end
