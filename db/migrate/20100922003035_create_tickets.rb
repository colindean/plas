class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.references :event
      t.float :price
      t.integer :available
      t.datetime :date_open
      t.datetime :date_closed
      t.boolean :package
      t.references :generates_ticket
      t.integer :generates_number

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
