class AddPermissionRegistrationsGive < ActiveRecord::Migration
  def self.up
		Permission.create :name => "Give Registrations", :code => "registrations.give", :category => "Registrations"
  end

  def self.down
    Permission.find_by_code("registrations.give").destroy
  end
end
