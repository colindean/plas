class Address < ActiveRecord::Base
	BILLING = 1
	SHIPPING = 2
	EMERGENCY = 3
	
  belongs_to :user

	
end
