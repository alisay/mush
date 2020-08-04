class AddPurchasedToMushrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :mushrooms, :purchased, :boolean, default: false
  end
end
