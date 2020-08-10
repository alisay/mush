class AddDetailsToMushrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :mushrooms, :latitude, :float
    add_column :mushrooms, :longitude, :float
    add_column :mushrooms, :address, :string
    add_column :mushrooms, :additional_comments, :text
  end
end
