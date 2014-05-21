class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.integer :discount
      t.float :latitude
      t.float :longitude
      t.integer :city_id
      t.string :address
      t.integer :category_id

      t.timestamps
    end
  end
end
