class Product < ApplicationRecord
  has_many :productorders
  has_many :orders, through: :productorders
end
