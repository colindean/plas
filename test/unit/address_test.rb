require 'test_helper'

class AddressTest < MiniTest::Unit::TestCase

  def setup
    @paypal_address = {
      'address1' => '13 Pittco Way',
      'address2' => 'Apt. 2',
      'city' => 'Pittsburgh',
      'state' => 'PA',
      'zip' => '15201',
      'phone' => '4125551212',
      'country' => 'USA'
    }
    @paypal_address_expected = '13 Pittco Way, Apt. 2, Pittsburgh, PA, 15201, USA'
  end

  def test_new_from_paypal
    address = Address.new_from_paypal_address(@paypal_address, false)
    assert_equal 'paypal', address.address_type
    assert_equal 'Pittsburgh', address.city
    assert_equal '4125551212', address.phone
    assert_equal '13 Pittco Way', address.line1
  end

  def test_pretty
    address = Address.new_from_paypal_address(@paypal_address, false)
    assert_equal @paypal_address_expected, address.pretty
  end

end

