class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.string :name, :null => false
			t.string :code, :null => false
			t.string :category, :null => false, :default => "General"

      t.timestamps
    end
		Permission.create :name => "Edit Users", :code => "users.edit"
		Permission.create :name => "Delete Users", :code => "users.delete"
		Permission.create :name => "Enable Maintenance Mode", :code => "mode.maintenance"
		Permission.create :name => "Start tournament", :code => "tournament.start"
		Permission.create :name => "Create tournament", :code => "tournament.create"
		Permission.create :name => "Change players' tournament team", :code => "tournament.change_team", :category => "Tournaments"
		Permission.create :name => "Record tournament results", :code => "tournament.record", :category => "Tournaments"
		Permission.create :name => "Mark users paid", :code => "payments.accept", :category => "Payments"
		Permission.create :name => "Start event", :code => "event.start", :category => "Event"
  end

  def self.down
    drop_table :permissions
  end
end
