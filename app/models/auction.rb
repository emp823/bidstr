class Auction < ActiveRecord::Base
  has_one :item
  has_many :users, through: :bids
  has_many :bids
  accepts_nested_attributes_for :bids

  def check_bid (value)
  	if self.bids.count > 0
  		result = value.to_d > self.bids.last.value ? true : false
  	else
  		result = true
  	end
  end

  def submit_bid (user_id, value)
  	bids.create!(user_id: user_id, auction_id: self.id, value: value)
  end
end
