class User < ApplicationRecord
   validates :name, presence: true

  devise :omniauthable, omniauth_providers: [:google_oauth2]


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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
end

end
