class Song < ApplicationRecord
  belongs_to :albom, optional: true
end
