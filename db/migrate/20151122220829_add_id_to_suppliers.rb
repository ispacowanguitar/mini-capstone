class AddIdToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :supplier_id, 'decimal USING CAST(supplier_id AS decimal)'
  end
end
