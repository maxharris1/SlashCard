class School < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :amb_phone, presence: true
  validates :amb_name, presence: true
  validates :amb_email, presence: true
  



  has_many :vendors
  has_many :users

  geocoded_by :address
  after_validation :geocode

end
