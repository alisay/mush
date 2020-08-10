class AddFlavourToMushrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :mushrooms, :flavour, null: false, foreign_key: true
  end
end
