class Shout < ActiveRecord::Base
  attr_accessible :text, :user
  belongs_to :user
  validates :user, :presence => true
  validates :text, :presence => true, :length => {:minimum => 1}
  
  alias author user

end
