class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :high_school_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
