class AddNameToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :name, :string, :null => false, :default => _('Registration for one person')
  end

  def self.down
    remove_column :tickets, :name
  end
end
