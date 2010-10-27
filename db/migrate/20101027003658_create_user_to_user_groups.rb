class CreateUserToUserGroups < ActiveRecord::Migration
  def self.up
    create_table :user_to_user_groups do |t|
      t.references :user
      t.references :user_group

      t.timestamps
    end
  end

  def self.down
    drop_table :user_to_user_groups
  end
end
