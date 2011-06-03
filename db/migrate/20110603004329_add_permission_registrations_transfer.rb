class AddPermissionRegistrationsTransfer < ActiveRecord::Migration
  def self.up
		Permission.create :name => "Transfer Registrations", :code => "registrations.transfer", :category => "Registrations"
    Permission.find_by_code("registrations.give").destroy
  end

  def self.down
		Permission.create :name => "Give Registrations", :code => "registrations.give", :category => "Registrations"
    Permission.find_by_code("registrations.transfer").destroy
  end
end
