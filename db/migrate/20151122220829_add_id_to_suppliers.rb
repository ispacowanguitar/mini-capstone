class AddIdToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :supplier_id, 'numeric USING CAST(supplier_id AS numeric)'
  end
end
