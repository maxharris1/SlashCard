class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name,  null: false, default: ""
      t.string :address,  null: false, default: ""
      t.float :lat, :precision => 10, :scale => 6, null: false
      t.float :lng, :precision => 10, :scale => 6, null: false
      t.text :description, null: false, default: ""
      t.string :amb_name, null: false, default: ""
      t.string :amb_email, null: false, default: ""
      t.string :amb_phone, null: false, default: ""
      t.datetime :remember_created_at
      t.timestamps
    end
  end
end

