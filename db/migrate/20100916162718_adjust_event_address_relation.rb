class AdjustEventAddressRelation < ActiveRecord::Migration
  def self.up
    add_column :addresses, :event_id, :integer
    add_index :addresses, :event_id
    remove_column :events, :address_id
  end

  def self.down
    remove_column :addresses, :event_id, :integer
    remove_index :addresses, :event_id
    add_column :events, :address_id
  end
end