require 'test_helper'

class WelcomeWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:welcome)
  end
  
  test "display" do
    render_widget :welcome
    assert_select "h1"
  end
end
