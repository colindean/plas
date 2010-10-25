class RenameTransactionType < ActiveRecord::Migration
  def self.up
    remove_column :transactions, :type
    add_column :transactions, :payment_media, :string
  end

  def self.down
    remove_column :transactions, :payment_media
    add_column :transactions, :type, :string
  end
end
