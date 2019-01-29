class AddIndexToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_index  :discounts, :vendor_id
  end
end
