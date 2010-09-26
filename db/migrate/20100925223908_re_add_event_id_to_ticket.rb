class ReAddEventIdToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :event_id, :integer
  end

  def self.down
    remove_column :tickets, :event_id
  end
end
