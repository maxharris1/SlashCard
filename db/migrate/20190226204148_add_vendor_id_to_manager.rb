 class AddVendorIdToManager < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :vendor_id, :integer
  end
end
