class Registration < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :purchaser, :class_name => "User"
  belongs_to :user
  belongs_to :package_parent, :class_name => "Registration"


end
