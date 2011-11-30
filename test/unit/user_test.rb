require 'test_helper'

class UserTest < MiniTest::Unit::TestCase

  def setup
    @user = User.new
    @user.name = 'Jon'
    @user.full_name = 'Jon Daniel'
    @user.pronunciation = 'John Dan`yell'
  end
  
  def test_display_name_is_name_with_no_handle
    assert_equal 'Jon Daniel', @user.display_name
  end
  
  def test_display_name_is_handle
    @user.handle = 'Shinary'
    
    assert_equal 'Shinary', @user.display_name
  end
end

