class RemoveFlavourFromMushrooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :mushrooms, :flavour, :string
  end
end
