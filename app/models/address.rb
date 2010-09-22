class Address < ActiveRecord::Base
	TYPES = [ 'billing', 'shipping', 'emergency', 'event' ]
	
  belongs_to :event_address
  belongs_to :event, :through => :event_address

  #belongs_to :user_addresses
  #belongs_to :users, :through => :user_addresses
  #TODO: do stuff with this model. there's not really a business need to collect addresses, so confirmeth bobk
	
end
