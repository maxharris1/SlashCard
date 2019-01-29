class AddSchoolIdToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :school_id, :integer
  end
end
