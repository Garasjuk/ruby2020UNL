class Gener < ApplicationRecord
  has_many :alboms
  validates :name, presence: true

  before_save :titlelize_names

    def titlelize_names
      self.name = self.name.titleize
    end
end
