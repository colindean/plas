require 'test_helper'


class PcfgTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  #
  setup do 
    @user = User.create({:handle => 'rhettigan'})
  end
  test "valid" do
    @p = Pcfg.create({:key => 'foo', :value => 'bar'})
    assert !@p.valid?
    @p.last_modified_by = @user
    assert @p.valid?
  end
end
