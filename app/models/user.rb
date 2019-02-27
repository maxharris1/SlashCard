class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :session_limitable



  has_many :vendors, dependent: :destroy
  has_many :redeemables
  has_many :reviews
  has_many :likes
  has_many :exclrewards
  belongs_to :school

  def likes?(review)
    review.likes.where(user_id: id).any?
  end


  def visited?(vendor)
    vendor.redeemables.where(user_id: id, is_redeemed: true).any?
  end

end
