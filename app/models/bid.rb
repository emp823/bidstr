class Bid < ActiveRecord::Base
	belongs_to :auction
	belongs_to :user
	validates_presence_of :value
end
