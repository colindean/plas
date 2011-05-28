require 'test_helper'

class TicketTest < ActiveSupport::TestCase

  setup do
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

  test "validity" do
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

  test "package generates" do
    assertEquals(@t, @tg.generates_ticket)
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
    assertEquals(1, @tg.remaining)
    assertEquals(100, @tg.remaining)
    #generate a registration
    assertEquals(0, @tg.remaining)
    assertEquals(100 - @tg.generates_number, @t.remaining)
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

  test "within sales period?" do
    assert @t.within_sales_period?
    @t.date_closed = Time.now - 100
    assert !@t.within_sales_period?
  end

end


