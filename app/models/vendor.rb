class Vendor < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :school_id, presence: true

  belongs_to :user
  belongs_to :school
  belongs_to :manager, optional: true
  has_many :redeemables
  has_many :discounts, dependent: :destroy
  has_many :reviews
  has_many :exclrewards

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "50x50>", small: "50x50>", display: "80%" }, convert_options: {medium: "-quality 75 -strip"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode

end