class Auction < ApplicationRecord
  belongs_to :user
  has_many :auction_items
  has_many :auction_bids

  validates :name, presence: true
  validates :auction_time, presence: true
  validates :user, presence: true

  def to_s
    name
  end

  def self.auction_items_winner
    data = []
    self.auction_items.each do |auction_item|
      data << auction_item.auction_bids
    end
    return data
  end
  
  def to_hash
    {
      name: name,
      auction_time: auction_time.strftime("%d-%m-%Y %T"),
    }
  end
end
