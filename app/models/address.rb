class Address < ActiveRecord::Base
	TYPES = [ 'billing', 'shipping', 'emergency', 'event' ]
	
  belongs_to :user
	belongs_to :event

  #TODO: do stuff with this model. there's not really a business need to collect addresses, so confirmeth bobk
	
end
