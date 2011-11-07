class CreatePlasTournaments < ActiveRecord::Migration
  def change
    create_table :plas_tournaments do |t|
      t.string :name
      t.references :winner
      t.references :creator
      t.integer :max_participants
      t.text :description

      t.timestamps
    end
    add_index :plas_tournaments, :winner_id
    add_index :plas_tournaments, :creator_id
  end
end
