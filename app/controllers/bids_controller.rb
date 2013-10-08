class BidsController < ApplicationController
	def index
		@bids = Bid.all
	end

	def new
		@bid = Bid.new
	end

	def create
		value = params[:bid][:value]
		auction = Auction.find(params[:bid][:auction_id])
		respond_to do |format|
			if auction.check_bid(value)
				auction.submit_bid(current_user.id, value)
				format.html { redirect_to auction, :flash => {:success => "Successful bid!"} }
				format.js
			else
				format.html { redirect_to auction, :flash => {:warning => "Bid was too low"} }
			end
		end
	end

	def destroy
	end

	private

		def bid_params
			params.require(:bid).permit(:user_id, :auction_id, :value)
		end
end
