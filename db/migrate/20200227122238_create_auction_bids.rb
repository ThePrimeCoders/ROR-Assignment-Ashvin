class CreateAuctionBids < ActiveRecord::Migration[5.0]
  def change
    create_table :auction_bids do |t|
      t.references :user, foreign_key: true
      t.references :auction_item, foreign_key: true
      t.references :auction, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
