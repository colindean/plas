class UserGroup < ActiveRecord::Base
  #TODO: validations
  has_many :users

end
