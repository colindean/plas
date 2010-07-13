class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :given_name
      t.string :family_name
      t.string :handle
      t.string :email
      t.string :password
      t.timestamp :date
      t.binary :picture
      t.boolean :enabled
      t.string :gaming_group
      t.datetime :date_arrival
      t.datetime :date_departure
      t.integer :gamer_type
      t.date :birthdate
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
