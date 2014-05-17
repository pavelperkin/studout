class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.float :discount
      t.float :latitude
      t.float :longitude
      t.integer :country_id
      t.integer :city_id
      t.string :address

      t.timestamps
    end
  end
end
