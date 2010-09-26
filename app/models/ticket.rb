class Ticket < ActiveRecord::Base
  belongs_to :event
  has_one :generates_ticket, :class_name => "Ticket"

  validates_numericality_of :price, :greater_than => 0, :presence => true
  validates_numericality_of :available, :greater_than => 0, :presence => true
  validates_numericality_of :generates_number, :greater_than => 0, :allow_blank => true

end
