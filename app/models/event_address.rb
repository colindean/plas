class EventAddress < ActiveRecord::Base
  belongs_to :event
  has_one :address
end
