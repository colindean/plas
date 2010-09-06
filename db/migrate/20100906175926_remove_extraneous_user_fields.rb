class RemoveExtraneousUserFields < ActiveRecord::Migration
  def self.up
		remove_column :users, :picture
		remove_column :users, :date
		remove_column :users, :enabled

		add_column :users, :disabled, :boolean, :null => false, :default => false
  end

  def self.down
		add_column :users, :picture, :string
		add_column :users, :date, :timestamp

		remove_column :users, :disabled
		add_column :users, :enabled, :boolean, :null => false, :default => true
  end
end
