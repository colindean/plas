class AddEventPerms < ActiveRecord::Migration
  def self.up
    ea = Permission.find_by_code('events.administrate')
    cat = _("Event")
    Permission.create :name => _("Create event"), :code => "events.create", :category => cat, :parent => ea
    Permission.create :name => _("Close event"), :code => "events.close", :category => cat, :parent => ea
    Permission.create :name => _("Check-in users"), :code => "events.checkin", :category => cat, :parent => ea
  end

  def self.down
    Permission.find_all_by_code(["events.create","events.close","event.checkin"]).each {|x| x.destroy }
  end
end
