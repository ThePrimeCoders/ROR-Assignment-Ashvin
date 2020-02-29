class AuctionItem < ApplicationRecord
  belongs_to :auction
  has_many :auction_bids

  validates :auction, presence: true
  validates :min_bid, presence: true
  validates :name, presence: true

  def to_hash
    {
      name: name,
      min_bid: min_bid,
      auction: auction.try(:name) 
    }
  end
end
