require 'test_helper'

class ShoutTest < ActiveSupport::TestCase
  test "blank should not be valid" do
     assert !Shout.new.valid?
  end
  
  test "without text but with user should not be valid" do
    s = Shout.new
    s.user = User.new
    assert !s.valid?
  end
  
  test "without user but with text should not be valid" do
    s = Shout.new
    s.text = "LJSDFLKSJF"
    assert !s.valid?
  end
  
  test "should be valid" do
    s = Shout.new
    s.text = "LKSJDLFKJSF"
    s.user = User.new
    assert s.valid?
  end
end
