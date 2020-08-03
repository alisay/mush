class Buyer < ApplicationRecord
  belongs_to :profile
  has_many :mushrooms

  has_and_belongs_to_many :sellers

end
