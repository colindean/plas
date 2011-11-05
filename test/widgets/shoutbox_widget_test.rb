require 'test_helper'

class ShoutboxWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:shoutbox)
  end
  
  test "display" do
    render_widget :shoutbox
    assert_select "h1"
  end
end
