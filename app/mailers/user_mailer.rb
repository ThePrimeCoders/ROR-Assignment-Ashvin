class UserMailer < ApplicationMailer
	def send_notification_mail(bid, user, auction)
		@bid = bid
		@user = user
		email = email.present? ? email : @bid.user.email
		mail(from: "Auction System <auction@app.com>", to: email, subject: 'Auction System')
	end

	def send_higher_bid_mail(bid, user, auction)
		@bid = bid
		@user = user
		email = email.present? ? email : @user.email
		mail(from: "Auction System <auction@app.com>", to: email, subject: 'Auction System')
	end
end
