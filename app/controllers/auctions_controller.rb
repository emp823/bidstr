class AuctionsController < ApplicationController
	def index
		@auctions = Auction.all
	end

	def new
		@auction = Auction.new
	end

	def create
	end

	def update
		@auction = Auction.find(params[:id])
		if @auction.update_attributes(auction_params)
			redirect_to @auction, success: "Updated Auction"
		else
			redirect_to @auction
		end
	end

	def destroy
	end

	def show
		@auction = Auction.find(params[:id])
	end

	private

		def auction_params
			params.require(:auction).permit(:name, :bids_attributes[:value, :user_id, :auction_id])
		end
end
