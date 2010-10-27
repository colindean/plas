class Permission < ActiveRecord::Base
  acts_as_tree :order => :code
  
  has_many :permission_to_user_group
  has_many :user_groups, :through => :permission_to_user_group
  has_many :users, :source => :user_groups
#  belongs_to :parent, :class_name => "Permission"

  
#  accepts_nested_attributes_for :parent, :allow_destroy => true
  #TODO: validations
  #def children
  #  Permission.find_by_parent_id(self)
  #end

end
