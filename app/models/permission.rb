class Permission < ActiveRecord::Base
  belongs_to :parent, :class_name => "Permission"
  
  #TODO: validations
  def children
    Permissions.find_by_parent_id(self)
  end

end
