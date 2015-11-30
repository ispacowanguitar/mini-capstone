class FixCategorytoName < ActiveRecord::Migration
  def change
    remove_column :categories, :small, :string
    remove_column :categories, :big, :string
    add_column :categories, :name, :string
  end
end
