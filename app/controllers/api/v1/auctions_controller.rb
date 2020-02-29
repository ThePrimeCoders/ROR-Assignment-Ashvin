class Api::V1::AuctionsController < Api::V1::ApplicationController
	before_action :authenticate_request!
	include ApiResponse
	before_action :set_auction, except: :index

	def index
		@auctions = Auction.where(activation: true).all.map(&:to_hash)
		ApiResponseSuccess(@auctions)
	end

	def show
		ApiResponseSuccess(@auction.to_hash)
	end

	private

  	def set_auction
    	@auction = Auction.find_by(id: params[:id], activation: true)
    	ApiResponseFailure('NotFound') if @auction.blank?
  	end
end
