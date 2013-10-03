class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :reserved_price
      t.integer :sold_price
      t.boolean :sold
      t.belongs_to :auction
      t.belongs_to :user
      t.timestamps
    end
  end
end
