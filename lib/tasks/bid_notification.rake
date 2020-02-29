desc 'Bid Notification when win the Bid'
task bid_notifiction: :environment do
	time = Time.now
	data = Auction.where("activation = ? and auction_time < ?", true, time)
	if data.present?
	    data.each do |auction|
	    	bids_data = auction.auction_items_winner
	    	if bids_data.present?
	    		bid = bids_data.where(amount: bids_data.maximum(:amount)).first
	    		UserMailer.send_notification_mail(bid, bid.user, auction)
	    		auction.update(activation: false)
	  		end
	  	end
	end
end