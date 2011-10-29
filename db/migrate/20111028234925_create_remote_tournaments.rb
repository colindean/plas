class CreateRemoteTournaments < ActiveRecord::Migration
  def change
    create_table :remote_tournaments do |t|
      t.string :remote_type
      t.string :remote_id
      t.references :tournament

      t.timestamps
    end
  end
end
