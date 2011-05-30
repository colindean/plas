class AddMoneyToRegAndTrans < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :amount, :cents
    add_column :transactions, :currency, :string, :default => "USD"

    rename_column :registrations, :price_paid, :paid_cents
    add_column :registrations, :paid_currency, :string, :default => "USD"
  end

  def self.down
    rename_column :transactions, :cents, :amount
    rename_column :registrations, :paid_cents, :price_paid

    remove_column :transactions, :currency
    remove_column :registrations, :paid_currency
  end
end
