class CreateEventAddresses < ActiveRecord::Migration
  def self.up
    create_table :event_addresses do |t|
      t.references :event
      t.references :address

      t.timestamps
    end
  end

  def self.down
    drop_table :event_addresses
  end
end
