class Address < ActiveRecord::Base
	BILLING = 1
	SHIPPING = 2
	EMERGENCY = 3
	
  belongs_to :user

  #TODO: do stuff with this model. there's not really a business need to collect addresses, so confirmeth bobk
	
end
