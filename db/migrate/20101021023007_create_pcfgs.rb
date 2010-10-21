class CreatePcfgs < ActiveRecord::Migration
  def self.up
    create_table :pcfgs do |t|
      t.text :key
      t.text :value
      t.references :last_modified_by

      t.timestamps
    end
  end

  def self.down
    drop_table :pcfgs
  end
end
