class Discount < ApplicationRecord

  validates :discount, presence: true
  validates :vendor_id, presence: true



  belongs_to :vendor

end
