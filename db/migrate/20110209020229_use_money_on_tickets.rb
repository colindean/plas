class UseMoneyOnTickets < ActiveRecord::Migration
  def self.up
    rename_column :tickets, :price, :cents
    add_column :tickets, :currency, :string
  end

  def self.down
    rename_column :tickets, :cents, :price
    remove_column :tickets, :currency
  end
end
