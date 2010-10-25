class AddTransactionToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :transaction_id, :integer
  end

  def self.down
    remove_column :registrations, :transaction_id
  end
end
