class CreateAuctionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :auction_items do |t|
      t.string :name
      t.integer :min_bid
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
