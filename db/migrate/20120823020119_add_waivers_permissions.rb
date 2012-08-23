class AddWaiversPermissions < ActiveRecord::Migration
  def up
    p = Permission.find_by_code("app.administrate")
    Permission.create :name => "Administrate Waivers", 
                      :code => "waivers.administrate", 
                      :category => "Waivers",
                      :parent => p
  end

  def down
    Permission.find_by_code("waivers.administrate").destroy
  end
end
