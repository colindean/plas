class CreatePermissionToUserGroups < ActiveRecord::Migration
  def self.up
    create_table :permission_to_user_groups do |t|
      t.references :permission
      t.references :user_group

      t.timestamps
    end
  end

  def self.down
    drop_table :permission_to_user_groups
  end
end
