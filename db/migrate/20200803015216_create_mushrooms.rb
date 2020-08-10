class CreateMushrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :mushrooms do |t|
      t.string :flavour
      t.references :buyer
      t.references :seller, null: false

      t.timestamps
    end
  end
end
