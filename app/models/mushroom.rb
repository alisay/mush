class Mushroom < ApplicationRecord
  belongs_to :flavour
  has_many_attached :pictures
  has_one :buyer, :class_name => 'Profile'
  belongs_to :seller, :class_name => 'Profile'

end
