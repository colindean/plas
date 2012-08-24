class DropUnnecessaryUserProperties < ActiveRecord::Migration
  def up
    [:gaming_group, :date_arrival, :date_departure, :gamer_type, :full_name].each do |s|
      remove_column :users, s
    end
  end

  def down
    add_column :users, :gaming_group, :string
    add_column :users, :date_arrival, :timestamp
    add_column :users, :date_departure, :timestamp
    add_column :users, :gamer_type, :string
    add_column :users, :full_name, :string
  end
end
