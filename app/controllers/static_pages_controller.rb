class StaticPagesController < ApplicationController
	def home
		@auctions = Auction.all.order('updated_at DESC').limit(4)
	end
end
