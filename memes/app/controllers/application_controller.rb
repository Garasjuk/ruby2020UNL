class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning
#  rescue_form User::NotAuthorized, with: :user_not_authorized

  # private def user_not_authorized
  #   flash[:error] = 'You shoud authorized'
  #   redirect_back(fallback_location: root_path)
  # end

end
