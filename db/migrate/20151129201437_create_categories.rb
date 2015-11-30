class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :small
      t.string :big

      t.timestamps null: false
    end
  end
end
