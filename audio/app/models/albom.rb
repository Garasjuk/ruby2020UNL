class Albom < ApplicationRecord
  belongs_to :group
  belongs_to :artist
  belongs_to :gener
  has_many :song
  accepts_nested_attributes_for :song
end
