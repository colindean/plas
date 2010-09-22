class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.references :ticket
      t.double :price_paid
      t.references :purchaser
      t.references :user
      t.timestamp :date_given
      t.references :package_parent
      t.boolean :checked_in
      t.timestamp :date_checked_in

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
