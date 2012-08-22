class AddWaiverToEvent < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.references :waiver
    end
  end
end
