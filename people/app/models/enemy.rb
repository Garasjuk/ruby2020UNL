class Enemy < User
 before_action :authenticate_user!
end
