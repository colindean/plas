require 'test_helper'

class PcfgTest < MiniTest::Unit::TestCase

  def setup
    @user = Factory :user, :handle => 'rhettigan'
  end

  def test_valid
    p = Pcfg.create :key => 'foo', :value => 'bar'
    # assert !p.valid?
    # p.last_modified_by = @user
    assert p.valid?
  end

end

