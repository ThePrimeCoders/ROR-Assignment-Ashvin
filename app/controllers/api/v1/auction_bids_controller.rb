class Api::V1::AuctionBidsController < Api::V1::ApplicationController
	before_action :authenticate_request!
	include ApiResponse
	before_action :set_auction_bid, only: [:edit, :show, :update]

	def index
		@auction_bids = AuctionBid.includes(:auction_item, :auction, :user).all.map(&:to_hash)
		ApiResponseSuccess(@auction_bids)

	end

	def list_bids
		auction_bids = current_user.auction_bids.includes(:auction_item, :auction).where(auction_id: params[:auction_id], auction_item_id: params[:auction_item_id])
		ApiResponseSuccess(auction_bids.map(&:to_record))
	end

	def highest_bids
		@bids = AuctionBid.where(auction_id: params[:auction_id], auction_item_id: params[:auction_item_id])
	end

	def show
		ApiResponseSuccess(@auction_bid.to_hash)
	end

	def new
		@auction_bid = AuctionBid.new
		ApiResponseSuccess(@auction_bid)
	end

	def create
		@auction_bid = current_user.auction_bids.new(auction_bid_params)
		if @auction_bid.save
			AuctionBid.bid_notication_send(@auction_bid)
			ApiResponseSuccess(@auction_bid.to_hash, "successfully submit.")
		else
			ApiResponseFailure(@auction_bid.errors)
		end
	end

	def edit
		ApiResponseSuccess(@auction_bid)
	end

	def update
		@auction_bid = AuctionBid.update(auction_bid_params)
		if @auction_bid.save
			ApiResponseSuccess(@auction_bid.to_hash, "successfully updated.")
		else
			ApiResponseFailure(@auction_bid.errors)
		end
	end

	private

	def auction_bid_params
		params.require(:auction_bid).permit(:amount, :auction_item_id, :user_id, :auction_id)
	end

  	def set_auction_bid
    	@auction_bid = AuctionBid.find_by(id: params[:id])
    	ApiResponseFailure('NotFound') if @auction_bid.blank?
  	end
end
