class Address < ActiveRecord::Base
=begin
This class is the central container for addresses in PLAS. 

These classes use it:

 * User
 * Event
 * Transaction

*Please keep this list up to date.*
=end

#TODO: validations

	TYPES = [ 'billing', 'shipping', 'emergency', 'event' ]
	
  belongs_to :event

  #belongs_to :users
  #TODO: do stuff with this model. there's not really a business need to collect addresses, so confirmeth bobk

  def pretty
    #eventually, this method will need to look at the country's address format
    #and output based on that. just join crap for now
    o = [line1, line2, line3, neighborhood, city, region, postcode, country]
    o.select! do |x| x != nil and !x.empty? end
    o.join(', ')
  end

  def self.new_from_paypal_address(address,autosave=true)
    a = self.new
    a.line1 = address["address1"]
    a.line2 = address["address2"]
    a.city = address["city"]
    a.region = address["state"]
    a.country = address["country"]
    a.postcode = address["zip"]
    a.address_type = "paypal"
    a.phone = address["phone"]
    a.save if autosave
    a
  end
end
