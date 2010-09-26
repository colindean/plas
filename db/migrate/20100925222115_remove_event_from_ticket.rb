class RemoveEventFromTicket < ActiveRecord::Migration
  def self.up
    remove_column :tickets, :event
  end

  def self.down
    add_column :tickets, :event, :type => :references
  end
end
