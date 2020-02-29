class Admins::AuctionBidsController < Admins::ApplicationController
	before_action :set_auction_bid, except: [:index, :new, :create]

	def index
		@auction_bids = AuctionBid.all
	end

end

