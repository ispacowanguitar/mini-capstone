class AddIdToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :supplier_id, 'integer USING CAST(price AS integer)'
  end
end
