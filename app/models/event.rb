class Event < ActiveRecord::Base
  #attr_accessible :address_attributes
  has_many :addresses, :dependent => :destroy
  has_many :tickets, :dependent => :destroy

  accepts_nested_attributes_for :addresses, :allow_destroy => true
  #TODO: validations
end
