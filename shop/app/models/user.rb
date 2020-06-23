class User < ApplicationRecord
  has_many :orders

  devise :database_authenticatable

  def self.search(params)
    user = all
    user = user.where("name LIKE ?", "%#{params[:search]}%") if params[:search]
    user
  end

  def self.authenticate(name, password)
		user = find_by_name(name)
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

end
