class UserGroup < ActiveRecord::Base
  attr_accessible :name
  #this is basically the join model for user<->permissions

  #TODO: validations
  has_many :user_to_user_group, :dependent => :destroy
  has_many :users, :through => :user_to_user_group
  has_many :permission_to_user_group, :dependent => :destroy
  has_many :permissions, :through => :permission_to_user_group

end
