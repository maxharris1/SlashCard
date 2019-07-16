class AddIsRedeemedToRedeemable < ActiveRecord::Migration[5.1]
  def change
    add_column :redeemables, :is_redeemed, :boolean, default: false
  end
end
