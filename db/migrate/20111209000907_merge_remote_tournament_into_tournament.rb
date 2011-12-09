class MergeRemoteTournamentIntoTournament < ActiveRecord::Migration
  def up
    drop_table "remote_tournaments"
    add_column :tournaments, :remote_type, :string
    add_column :tournaments, :remote_id, :integer
  end

  def down
    create_table "remote_tournaments", :force => true do |t|
      t.string   "remote_type"
      t.string   "remote_id"
      t.integer  "tournament_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    [:remote_type, :remote_id].each do |s|
      remove_column :tournaments, s
    end
  end
end
