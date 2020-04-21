class Command < ApplicationRecord
	# before_action :authenticate_user!
	has_many :user
	validates :name, uniqueness: true

	def self.search(params)
		command = all
		command = command.where("name LIKE ?", "%#{params[:search]}%") if params[:search]
		command
	end


end
