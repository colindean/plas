class Ticket < ActiveRecord::Base
  belongs_to :event
  has_one :generates_ticket, :class_name => "Ticket"

end
