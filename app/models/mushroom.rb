class Mushroom < ApplicationRecord
  belongs_to :seller
  has_many_attached :pictures
end
