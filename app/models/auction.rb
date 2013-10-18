class Auction < ActiveRecord::Base
  has_one :item
  has_many :users, through: :bids
  has_many :bids
  validates_presence_of :name

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

  def call
    item = self.item
    self.update_attributes(:active => false)
    if self.bids.count > 0
      price = self.bids.last.value
      user = self.bids.last.user_id
      item.update_attributes(:sold => true, :sold_price => price, :user_id => user)
    end
  end
end
