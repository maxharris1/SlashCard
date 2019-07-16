class AddIsRedeemedToExclrewards < ActiveRecord::Migration[5.1]
  def change
    add_column :exclrewards, :is_redeemed, :boolean, default: false
  end
end
