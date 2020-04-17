class User < ApplicationRecord
  belongs_to :command
  
  def self.search(params)
		user = all
		user = user.where("name LIKE ?", "%#{params[:search]}%") if params[:search]
		user
	end
end
