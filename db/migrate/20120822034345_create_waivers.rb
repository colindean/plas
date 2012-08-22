class CreateWaivers < ActiveRecord::Migration
  def change
    create_table :waivers do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
