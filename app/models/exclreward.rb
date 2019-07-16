class Exclreward < ApplicationRecord

  validates :user_id, presence: true
  validates :vendor_id, presence: true
  validates :redeem_code, presence: true



  belongs_to :user
  belongs_to :vendor
  belongs_to :manager

end
