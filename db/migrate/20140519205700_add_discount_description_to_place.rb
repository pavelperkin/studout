class AddDiscountDescriptionToPlace < ActiveRecord::Migration
  def change
    add_column :places, :discount_description, :text
  end
end
