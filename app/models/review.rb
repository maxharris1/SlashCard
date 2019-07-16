class Review < ApplicationRecord

  validates :user_id, presence: true
  validates :vendor_id, presence: true
  validates :rating, presence: true
  validates :description, presence: true


  belongs_to :user
  belongs_to :vendor
  has_many :likes


  def blank_stars
    5 - rating.to_i
  end


end
