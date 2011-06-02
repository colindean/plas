require 'test_helper'

class RegistrationGiftLogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  setup do
    @u1 = User.new
    @u2 = User.new
    @u3 = User.new

    @r = Registration.new
    @t = Transaction.new
    @r.transaction = @t
    @rgl = RegistrationGiftLog.new
  end
  
  test "basic validation" do

    assert !@rgl.valid?

    @rgl.to_user = @u1
    @rgl.from_user = @u2
    @rgl.by_user = @u3

    assert !@rgl.valid?

    @rgl.registration = @r

    assert @rgl.valid?
  end

  test "to and from cannot be the same" do
    @rgl.to_user = @u1
    @rgl.from_user = @u1
    @rgl.by_user = @u2
    @rgl.registration = @r

    assert !@rgl.valid?

    @rgl.from_user = @u3

    assert @rgl.valid?
  end

  test "reg isn't givable" do
    @rgl.registration = @r    
    @rgl.to_user = @u1
    @rgl.from_user = @u2
    @rgl.by_user = @u3
    
    @r.transaction = nil
    assert !@rgl.valid?

    @r.checked_in = true
    assert !@rgl.valid?

    @r.transaction = @t
    @r.checked_in = false
    assert @rgl.valid?, @rgl.errors.full_messages.join(",")
  end

end
