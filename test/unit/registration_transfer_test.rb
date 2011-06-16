require 'test_helper'

class RegistrationTransferTest < MiniTest::Unit::TestCase

  def setup
    @u1 = User.new
    @u2 = User.new
    @u3 = User.new

    @r = Registration.new
    @t = Transaction.new
    @r.transaction = @t
    #why @rgl? RegistrationTransfer used to be RegistrationGiftLog
    @rgl = RegistrationTransfer.new
  end
  
  def test_basic_validation

    assert !@rgl.valid?

    @rgl.to_user = @u1
    @rgl.from_user = @u2
    @rgl.by_user = @u3

    assert !@rgl.valid?

    @rgl.registration = @r

    assert @rgl.valid?
  end

  def test_to_and_from_cannot_be_the_same
    @rgl.to_user = @u1
    @rgl.from_user = @u1
    @rgl.by_user = @u2
    @rgl.registration = @r

    assert !@rgl.valid?

    @rgl.from_user = @u3

    assert @rgl.valid?
  end

  def test_reg_isnt_givable
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

