class AddIdsToBids < ActiveRecord::Migration
  def change
  	add_column :bids, :user_id, :integer
  	add_column :bids, :auction_id, :integer
  end
end
