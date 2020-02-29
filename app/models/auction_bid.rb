class AuctionBid < ApplicationRecord
  require 'active_support/core_ext'
  belongs_to :user
  belongs_to :auction_item
  belongs_to :auction

  def self.bid_notication_send(bid)
    bids = Auction.where(activation: true, id: bid.auction_id).last.auction_bids.where("auction_item_id = ? and amount < ?", bid.auction_item_id, bid.amount).where.not(user_id: bid.user_id)
    users = bids.map(&:user_id).uniq
    User.where(id: users).each do |user|
      UserMailer.send_higher_bid_mail(bid, user, bid.auction).deliver_now!
    end
  end

  def to_hash
    {
      amount: amount,
      auction: auction.try(:name), 
      auction_item: auction_item.try(:name),
      user: user.try(:name),
      bid_time: created_at.strftime("%d/%m/%Y %T")
    }
  end

  def to_record
    {
      amount: amount,
      auction: auction.try(:name), 
      auction_item: auction_item.try(:name),
      bid_time: created_at.strftime("%d/%m/%Y %T")
    }
  end

  def bid_detail
    {
      amount: amount,
      auction: auction.try(:name), 
      auction_item: auction_item.try(:name),
      user: user.try(:name)
    }
  end
end
