class User < ApplicationRecord
  belongs_to :role
  before_create :set_role

  def self.authenticate(username, password)
   user = find_by_username(username)
   if user && user.password == password
     user
   else
     nil
   end
 end

 def encrypt_password
   if password.present?
     self.password = password
   end
 end

 private def set_role
   role_params = {:create_at => false, :update_at => false, :read_at => true, :delete_at => false, :admin_at =>false}
   @role =  Role.new(role_params)
   @role.save
 end
end
