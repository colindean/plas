class AddPermissions < ActiveRecord::Migration
  def self.up
#    add_column :permissions, :parent_id, :integer
    god = Permission.create :code => "app.administrate", :name => "Administrate Everything (godmode)", :category => "Application Administration"
    ea = Permission.create :code => "events.administrate", :name => "Administrate Events", :category => "Events", :parent => god
    ua = Permission.create :code => "users.administrate", :name => "Administrate Users", :category => "Users", :parent => god
    ta = Permission.create :code => "tickets.administrate", :name => "Administrate Tickets", :category => "Tickets", :parent => god
    tma = Permission.create :code => "tournaments.administrate", :name => "Administrate Tournaments", :category => "Tournaments", :parent => god

    #now, fix all the permissions previously added
    user_perms = []
    user_perms << Permission.find_by_code("users.edit")
    user_perms << Permission.find_by_code("users.delete")
    user_perms.each {|p| p.parent = ua; p.save }
    tourn_perms = []
    tourn_perms << Permission.find_by_code("tournaments.start")
    tourn_perms << Permission.find_by_code("tournaments.create")
    tourn_perms << Permission.find_by_code("tournaments.change_team")
    tourn_perms << Permission.find_by_code("tournaments.record")
    tourn_perms.each {|p| p.parent = tma; p.save }
    demigod_perms = []
    demigod_perms << Permission.find_by_code("payments.accept")
    demigod_perms << Permission.find_by_code("mode.maintenance")
    demigod_perms.each {|p| p.parent = god; p.save }
    
    es = Permission.find_by_code("events.start")
    es.parent = ea
    es.save
  end

  def self.down
    remove_column :permissions, :parent_id
    perms = []
    perms << Permission.find_by_code("app.administrate")
    perms << Permission.find_by_code("events.administrate")
    perms << Permission.find_by_code("users.administrate")
    perms << Permission.find_by_code("tickets.administrate")
    perms << Permission.find_by_code("tournaments.administrate")
    perms.each {|p| p.destroy}
  end
end
