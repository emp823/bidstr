class Item < ActiveRecord::Base
  validates_presence_of :name, :reserved_price
  validates_uniqueness_of :name
  belongs_to :auction
end
