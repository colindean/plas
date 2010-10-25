class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.references :address
      t.string :email
      t.string :payer_name
      t.string :payer_country
      t.string :processor_userid
      t.string :payment_id
      t.string :type
      t.references :recorded_by
      t.integer :amount
      t.text :comments
      t.references :registration

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
