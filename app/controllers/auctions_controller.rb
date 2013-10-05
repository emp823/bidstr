class AuctionsController < ApplicationController
	def index
		@auctions = Auction.all
	end

	def new
	end

	def create
	end

	def destroy
	end

	def show
		@auction = Auction.find(params[:id])
	end
end
