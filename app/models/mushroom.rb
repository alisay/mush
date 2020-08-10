class Mushroom < ApplicationRecord
  belongs_to :seller
  belongs_to :flavour
  has_many_attached :pictures
end
