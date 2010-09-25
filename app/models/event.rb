class Event < ActiveRecord::Base
  #attr_accessible :address_attributes
  has_many :addresses
  has_many :tickets

  accepts_nested_attributes_for :addresses, :allow_destroy => true

end
