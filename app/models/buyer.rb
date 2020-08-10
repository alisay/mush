class Buyer < ApplicationRecord
  belongs_to :profile
  has_many :mushrooms

end
