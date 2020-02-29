class AddActivationToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :activation, :boolean, default: true
  end
end
