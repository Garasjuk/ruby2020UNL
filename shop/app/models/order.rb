class Order < ApplicationRecord
  has_many :productorders
  has_many :products, through: :productorders
  belongs_to :users
end
