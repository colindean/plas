class AddCryptedPassword < ActiveRecord::Migration
  def self.up
		change_column :users, :password_salt, :string, :limit => nil
    add_column :users, :crypted_password, :string, :limit => nil, :null => false, :default => ''
		remove_column :users, :password
  end

  def self.down
		add_column :users, :password, :string, :null => false, :default => ''
		remove_column :users, :crypted_password
		change_column :users, :password_salt, :string, :limit => 40
  end
end
