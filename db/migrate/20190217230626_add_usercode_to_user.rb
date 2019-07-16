class AddUsercodeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :redeem_code, :string
  end
end
