class Auction < ActiveRecord::Base
  has_one :item
  has_many :users, through: :bids
end
