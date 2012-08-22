class Waiver < ActiveRecord::Base
  has_many :events
  attr_accessible :body, :title
end
