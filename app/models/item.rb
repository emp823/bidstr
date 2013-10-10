class Item < ActiveRecord::Base
  validates_presence_of :name, :reserved_price
  validates_uniqueness_of :name
  belongs_to :auction
  belongs_to :user

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("lower(name) like lower(?)", "%#{query}%") 
  end

  def auction_status
  	if !self.auction.nil?
	  	status = self.auction.active
	  	case status
	  	when true
	  		"Active"
	  	when false
	  		"Closed"
	  	else
	  		"None"
	  	end
	  else
	  	"No Auction Yet"
	  end
  end
end
