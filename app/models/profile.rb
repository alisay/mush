class Profile < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    has_many :bought_mushrooms, class_name: 'Mushroom', foreign_key: :buyer_id
    has_many :owned_mushrooms, class_name: 'Mushroom', foreign_key: :seller_id
  end
