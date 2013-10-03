class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :value
      t.timestamps
    end
  end
end
