class AddManageridToExclrewards < ActiveRecord::Migration[5.1]
  def change
    add_column :exclrewards, :manager_id, :integer
  end
end
