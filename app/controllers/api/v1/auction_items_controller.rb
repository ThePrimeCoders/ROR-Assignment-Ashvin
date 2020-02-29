class Api::V1::AuctionItemsController < Api::V1::ApplicationController
	before_action :authenticate_request!
	include ApiResponse
	before_action :set_auction
	before_action :set_auction_item, except: :index

	def index
		@auction_items = @auction.auction_items.map(&:to_hash)
		ApiResponseSuccess(@auction_items)
	end

	def show
		ApiResponseSuccess(@auction_item)
	end

	private

  	def set_auction_item
    	@auction_item = @auction.auction_items.find_by(id: params[:id])
    	ApiResponseFailure('NotFound') if @auction_item.blank?
  	end

  	def set_auction
  		@auction = Auction.find_by!(id: params[:auction_id], activation: true)
  		ApiResponseFailure('NotFound') if @auction.blank?
  	end
end
