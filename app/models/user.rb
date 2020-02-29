class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :auctions
  has_many :auction_bids

  enum role: [:user, :admin]

  def name
  	"#{firstname} #{lastname}"
  end
end
