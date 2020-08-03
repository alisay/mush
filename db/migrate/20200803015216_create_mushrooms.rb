class CreateMushrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :mushrooms do |t|
      t.string :type
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
