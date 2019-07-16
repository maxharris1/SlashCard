class AddAttachmentLogoToVendors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :vendors do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :vendors, :logo
  end
end
