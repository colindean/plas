class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.references :address
      t.boolean :registration_open
      t.boolean :visible
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
