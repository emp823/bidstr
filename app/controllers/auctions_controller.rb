class AuctionsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]
	before_filter :check_admin, except: [:index, :show]

	def index
		@auctions = Auction.where(:active => true)
	end

	def new
		@auction = Auction.new
	end

	def create
	end

	def update
		@auction = Auction.find(params[:id])
		if @auction.update_attributes(auction_params)
			redirect_to @auction, :flash => {:success => "Updated auction!"}
		else
			redirect_to @auction
		end
	end

	def destroy
	end

	def show
		@auction = Auction.find(params[:id])
	end

	def call
		@auction = Auction.find(params[:id])
		@auction.call if @auction.active?
		redirect_to @auction, :flash => {:success => "Called auction"}
	end

	private

		def auction_params
			params.require(:auction).permit(:name, :bids_attributes[:value, :user_id, :auction_id])
		end
end
