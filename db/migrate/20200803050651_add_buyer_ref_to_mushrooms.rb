class AddBuyerRefToMushrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :mushrooms, :buyer, null: true, foreign_key: true
  end
end
