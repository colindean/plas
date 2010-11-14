class AddTransactionViewPermission < ActiveRecord::Migration
  def self.up
    p = Permission.find_by_code("app.administrate")
    Permission.create :code => "transactions.view", :name => "View Transactions", :category => "Transactions", :parent => p

  end

  def self.down
  end
end
