class CreateRegistrationTransfers < ActiveRecord::Migration
  def self.up
    create_table :registration_transfers do |t|
      t.references :to_user
      t.references :from_user
      t.references :by_user
      t.references :registration

      t.timestamps
    end
  end

  def self.down
    drop_table :registration_transfers
  end
end
