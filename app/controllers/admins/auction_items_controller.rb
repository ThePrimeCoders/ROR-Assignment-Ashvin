class Admins::AuctionItemsController < Admins::ApplicationController
	before_action :set_auction_item, except: [:index, :new, :create]

	def index
		@auction_items = AuctionItem.all
	end

	def new
    	@auction_item = AuctionItem.new
    	@auctions = Auction.all
	end

  	def create
    	@auction_item = AuctionItem.new(auction_item_params)
		if @auction_item.save
	      redirect_to(admins_auction_items_path(@auction_item))
	    else
	      render(:new)
	    end
	end

	def edit
		@auctions = Auction.all
  	end
  
	def update
	    if @auction_item.update(auction_item_params)
	      redirect_to(admins_auction_items_path)
	    else
	      render(:edit)
	    end
	end

	def destroy
	    if @auction_item.destroy
	      redirect_to(admins_auction_items_path)
	    else
	      render(:new)
	    end
	end

	private
  
  	def set_auction_item
	    @auction_item = AuctionItem.find_by!(id: params[:id])
	end

	def auction_item_params
		params.require(:auction_item).permit(:name, :min_bid, :auction_id)
	end
end

