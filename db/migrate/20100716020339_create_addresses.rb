class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :neighborhood
      t.string :city
      t.string :region
      t.string :country
      t.string :postcode
      t.integer :type
      t.boolean :primary
			t.string :phone
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
