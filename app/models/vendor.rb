class Vendor < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user
end