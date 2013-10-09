class StaticPagesController < ApplicationController
	def home
		@auctions = Auction.all.order('updated_at DESC').limit(5)
	end
end
