class Permission < ActiveRecord::Base
  acts_as_tree :order => :code
  
#  belongs_to :parent, :class_name => "Permission"

  
#  accepts_nested_attributes_for :parent, :allow_destroy => true
  #TODO: validations
  #def children
  #  Permission.find_by_parent_id(self)
  #end

end
