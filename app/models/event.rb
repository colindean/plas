class Event < ActiveRecord::Base
  #attr_accessible :address_attributes
  has_one :event_address
  has_one :address, :through => :event_address
  has_many :tickets

  accepts_nested_attributes_for :address, :allow_destroy => true
end
