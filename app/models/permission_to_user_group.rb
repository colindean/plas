class PermissionToUserGroup < ActiveRecord::Base
  belongs_to :permission
  belongs_to :user_group
end
