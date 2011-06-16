require 'test_helper'

class TicketTest < MiniTest::Unit::TestCase

  def setup
    @t = Ticket.new
    @t.price = Money.new(1000)
    @t.available = 100
    @t.package = false
    @t.generates_number = 1
    @t.date_open = Time.now
    @t.date_closed = Time.now + 1000

    @tg = Ticket.new
    @tg.price = Money.new(5000)
    @tg.available = 1
    @tg.date_open = Time.now
    @tg.date_closed = Time.now + 1000
    @tg.generates_number = 5
    @tg.package = true
    @tg.generates_ticket = @t
  end

  def test_price
    assert_equal Money.new(1000), @t.price
    assert_equal Money.new(5000), @tg.price
    assert_equal 10.0, @t.price.dollars
  end

  def test_validity
    assert @t.valid?
    assert @tg.valid?

    @t.available = 0
    assert !@t.valid?

    @tg.price = Money.new(0)
    assert !@tg.valid?

    @tg.generates_number = 0
    @tg.price = Money.new(1000)
    assert !@tg.valid?
  end

  def test_package_generates
    assert_equal(@t, @tg.generates_ticket)
  end

  def test_within_sales_period
    assert @t.within_sales_period?
    @t.date_closed = Time.now - 100
    assert !@t.within_sales_period?
  end

=begin
  #I think this needs to be a functional test because it involves too much
  #other stuff
  
  test "sold out" do
    assert !@tg.sold_out?
    #generate a registration
    assert @tg.sold_out?
  end

  test "remaining" do
    assert_equal(1, @tg.remaining)
    assert_equal(100, @tg.remaining)
    #generate a registration
    assert_equal(0, @tg.remaining)
    assert_equal(100 - @tg.generates_number, @t.remaining)
  end

  test "available?" do
    assert @t.available?
    assert @tg.available?
    #generate a registration for @tg
    assert !@tg.available?
    @t.date_closed = Time.now - 100
    assert !@t.available?
  end

=end

end

