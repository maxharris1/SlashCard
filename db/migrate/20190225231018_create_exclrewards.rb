class CreateExclrewards < ActiveRecord::Migration[5.1]
  def change
    create_table :exclrewards do |t|
      t.integer :user_id,  null: false, default: ""
      t.integer :vendor_id,  null: false, default: ""
      t.integer :discount_id,  null: false, default: ""
      t.string :redeem_code, null: false, default: ""
      t.text :description, null: false, default: ""
      t.datetime :remember_created_at
      t.timestamps
    end
  end
end
