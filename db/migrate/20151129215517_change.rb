class Change < ActiveRecord::Migration
  def change
    remove_column :categorized_products, :categorized_id, :integer
    add_column :categorized_products, :category_id, :integer
  end
end
