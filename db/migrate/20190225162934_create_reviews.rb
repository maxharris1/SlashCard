class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id,  null: false, default: ""
      t.string :name, null: false, default: ""
      t.integer :rating, null: false, default: 0
      t.integer :vendor_id,  null: false, default: ""
      t.text :description, null: false, default: ""
      t.datetime :remember_created_at
      t.timestamps
    end
  end
end

