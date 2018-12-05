class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
    t.string :name,  null: false, default: ""
    t.string :address,  null: false, default: ""
    t.string :email,  null: false, default: ""
    t.string :phone_number,  null: false, default: ""
    t.text :description, null: false, default: ""
    t.string :school,              null: false, default: ""
    t.datetime :remember_created_at
    t.timestamps null: false
      end
  end
end
