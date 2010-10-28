class AddDefaultUserGroups < ActiveRecord::Migration
  def self.up
    #administrators
    aa = UserGroup.create :name => "Application Administrators"
    aa.permissions << Permission.find_by_code('app.administrate')
    ea = UserGroup.create :name => "Event Administrators"
    ea.permissions << Permission.find_by_code('events.administrate')
    ua = UserGroup.create :name => "User Administrators"
    ua.permissions << Permission.find_by_code('users.administrate')
    ta = UserGroup.create :name => "Ticket Administrators"
    ta.permissions << Permission.find_by_code('tickets.administrate')
    toa = UserGroup.create :name => "Tournament Administrators"
    toa.permissions << Permission.find_by_code('tournaments.administrate')

    #regular staff
    checkin = UserGroup.create :name => "Check-in Staff"
    checkin.permissions << Permission.find_by_code('payments.accept')

  end

  def self.down
    UserGroup.find_all_by_name([
                               'Application Administrators', 
                               'Event Administrators',
                               'User Administrators',
                               'Ticket Administrators',
                               'Tournament Administrators',
                               'Check-in Staff']).each {|ug| ug.destroy}
  end
end
