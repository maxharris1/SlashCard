class AddHasBusinessToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :has_Business, :boolean
  end
end
