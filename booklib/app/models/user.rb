class User < ApplicationRecord
  def self.authenticate(name, password)
    user = find_by_name(name)
    if user && user.pass == password
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.pass = password
    end
  end
end
