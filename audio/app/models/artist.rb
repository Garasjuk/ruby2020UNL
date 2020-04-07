class Artist < ApplicationRecord
  belongs_to :group
  has_many :albom 
end
