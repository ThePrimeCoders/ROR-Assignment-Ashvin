class AddPhoneNoAndRoleFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :phone_no, :string
  	add_column :users, :role, :integer, default: 0
  end
end
