class AddAdditionalInfoToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :website, :string
    add_column :vendors, :manager_name, :string
    add_column :vendors, :manager_number, :string
    add_column :vendors, :manager_email, :string
  end
end
