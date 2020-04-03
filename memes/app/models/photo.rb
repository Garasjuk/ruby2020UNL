class Photo < ApplicationRecord
  belongs_to :meme
  has_many :voting
  mount_uploader :image, ImageUploader
  validates :image, presence: true


end
