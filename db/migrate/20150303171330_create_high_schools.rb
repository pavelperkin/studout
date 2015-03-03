class CreateHighSchools < ActiveRecord::Migration
  def change
    create_table :high_schools do |t|
      t.string :name

      t.timestamps
    end
  end
end
