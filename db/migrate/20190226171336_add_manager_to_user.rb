class AddManagerToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_manager, :boolean, default: false
  end
end
