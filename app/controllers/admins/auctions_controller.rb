class Admins::AuctionsController < Admins::ApplicationController
	before_action :set_auction, except: [:index, :new, :create]

	def index
		@auctions = Auction.all
	end

	def new
    	@auction = Auction.new
	end

  	def create
    	@auction = current_user.auctions.new(auction_params)
		if @auction.save
	      redirect_to(admins_auctions_path(@auction))
	    else
	      render(:new)
	    end
	end

	def edit
  	end
  
	def update
	    if @auction.update(auction_params)
	      redirect_to(admins_auctions_path)
	    else
	      render(:edit)
	    end
	end

	def destroy
	    if @auction.destroy
	      redirect_to(admins_auctions_path)
	    else
	      render(:new)
	    end
	end

	private
  
  	def set_auction
	    @auction = Auction.find_by!(id: params[:id])
	end

	def auction_params
		params.require(:auction).permit(:name, :auction_time, :user_id)
	end
end
