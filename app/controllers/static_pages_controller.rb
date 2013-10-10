class StaticPagesController < ApplicationController
	def home
		@auctions = Auction.where(:active => true).order('updated_at DESC').limit(5)
	end
end
