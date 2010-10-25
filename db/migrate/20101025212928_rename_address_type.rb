class RenameAddressType < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :type
    add_column :addresses, :address_type, :string
  end

  def self.down
    remove_column :addresses, :address_type
    add_column :addresses, :type, :string
  end
end
