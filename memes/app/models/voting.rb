class Voting < ApplicationRecord
  belongs_to :photo
  validates :rating, presence: true
end
