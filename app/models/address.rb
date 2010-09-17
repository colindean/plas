class Address < ActiveRecord::Base
	TYPES = [ 'billing', 'shipping', 'emergency', 'event' ]
	
  has_many :event_addresses
  has_many :events, :through => :event_addresses

  #TODO: do stuff with this model. there's not really a business need to collect addresses, so confirmeth bobk
	
end
