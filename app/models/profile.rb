class Profile < ApplicationRecord
validates :name, presence: true
belongs_to :user
has_one :seller
end
