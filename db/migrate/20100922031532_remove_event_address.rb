class RemoveEventAddress < ActiveRecord::Migration
  def self.down
    create_table :event_addresses do |t|
      t.references :event
      t.references :address

      t.timestamps
    end
  end

  def self.up
    drop_table :event_addresses
  end
end
