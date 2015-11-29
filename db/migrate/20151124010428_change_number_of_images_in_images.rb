class ChangeNumberOfImagesInImages < ActiveRecord::Migration
  def change
    remove_column :images, :image_1, :string
    remove_column :images, :image_2, :string
    remove_column :images, :image_3, :string

    add_column :images, :image, :string
  end
end
