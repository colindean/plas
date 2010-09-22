class EventAddress < ActiveRecord::Base
  belongs_to :event
  has_many :addresses
end
