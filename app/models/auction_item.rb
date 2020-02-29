class AuctionItem < ApplicationRecord
  belongs_to :auction
  has_many :auction_bids

  def to_hash
    {
      name: name,
      min_bid: min_bid,
      auction: auction.try(:name) 
    }
  end
end
