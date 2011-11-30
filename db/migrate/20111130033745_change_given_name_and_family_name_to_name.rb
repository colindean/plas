class ChangeGivenNameAndFamilyNameToName < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :full_name, :string
    add_column :users, :pronunciation, :string

    remove_column :users, :given_name
    remove_column :users, :family_name
  end

  def down
    add_column :users, :given_name, :string
    add_column :users, :family_name, :string
    
    remove_column :users, :name
    remove_column :users, :full_name
    remove_column :users, :pronunciation
  end
end
