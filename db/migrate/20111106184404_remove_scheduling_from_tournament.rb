class RemoveSchedulingFromTournament < ActiveRecord::Migration
  def up
    remove_column :tournaments, :started_at
    remove_column :tournaments, :start_time
  end

  def down
    add_column :tournaments, :started_at, :type=>:timestamp
    add_column :tournaments, :start_time, :type=>:datetime
  end
end
