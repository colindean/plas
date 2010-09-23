class Address < ActiveRecord::Base
	TYPES = [ 'billing', 'shipping', 'emergency', 'event' ]
	
  belongs_to :event

  #belongs_to :users
  #TODO: do stuff with this model. there's not really a business need to collect addresses, so confirmeth bobk

  def pretty
    #eventually, this method will need to look at the country's address format
    #and output based on that. just join crap for now
    o = [line1, line2, line3, neighborhood, city, region, postcode, country]
    o.select! do |x| !x.empty? end
    o.join(', ')
  end
end
