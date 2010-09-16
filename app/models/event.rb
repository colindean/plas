class Event < ActiveRecord::Base
  #attr_accessible :address_attributes
  has_one :address
	accepts_nested_attributes_for :address, :allow_destroy => true
end
