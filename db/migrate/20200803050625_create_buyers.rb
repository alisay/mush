class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
