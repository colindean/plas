require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  setup do
    @paypal_address = { "address1" => "13 Pittco Way", 
                 "address2" => "Apt. 2",
                 "city" => "Pittsburgh",
                 "state" => "PA",
                 "country" => "USA",
                 "zip" => "15201",
                 "phone" => "4125551212" }
    @paypal_address_expected = "13 Pittco Way, Apt. 2, Pittsburgh, PA, 15201, USA"
  end

  test "new from paypal" do
    a = Address.new_from_paypal_address(@paypal_address, false) #do not autosave
    assertEquals("paypal", a.address_type)
    assertEquals(@paypal_address["city"], a.city)
    assertEquals(@paypal_address["phone"], a.phone)
    assertEquals(@paypal_address["address1"], a.line1)
  end

  test "pretty" do
    a = Address.new_from_paypal_address(@paypal_address, false) #do not autosave
    assertEquals(@paypal_address_expected, a.pretty)
  end

end
