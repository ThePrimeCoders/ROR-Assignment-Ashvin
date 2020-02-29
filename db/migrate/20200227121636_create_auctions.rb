class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.datetime :auction_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
