class Shout < ActiveRecord::Base
  belongs_to :user
  validates :user, :presence => true
  validates :text, :presence => true, :length => {:minimum => 0}
  
  alias author user

end
