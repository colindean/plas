class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :text
      t.references :user

      t.timestamps
    end
    add_index :shouts, :user_id
  end
end
