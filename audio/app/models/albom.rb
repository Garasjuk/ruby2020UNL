class Albom < ApplicationRecord
  belongs_to :group
  belongs_to :artist
  belongs_to :gener
  has_many :songs
  accepts_nested_attributes_for :songs
  validates :name, presence: true
  validates :description, presence: true

  before_save :titlelize_names

    def titlelize_names
      self.name = self.name.titleize
    end
end
