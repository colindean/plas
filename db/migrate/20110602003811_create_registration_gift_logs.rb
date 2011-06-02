class CreateRegistrationGiftLogs < ActiveRecord::Migration
  def self.up
    create_table :registration_gift_logs do |t|
      t.references :registration
      t.references :to_user
      t.references :from_user
      t.references :by_user

      t.timestamps
    end
  end

  def self.down
    drop_table :registration_gift_logs
  end
end
