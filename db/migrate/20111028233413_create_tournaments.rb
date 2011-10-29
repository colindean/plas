class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :description
      t.integer :max_participants
      t.datetime :start_time
      t.timestamp :started_at
      t.references :event

      t.timestamps
    end
    add_index :tournaments, :event_id
  end
end
