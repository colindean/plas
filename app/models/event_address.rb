class EventAddress < ActiveRecord::Base
  belongs_to :event
  belongs_to :address
end
