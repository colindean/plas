require 'test_helper'

class OpensourceWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:opensource)
  end
  
  test "display" do
    render_widget :opensource
    assert_select "h1"
  end
end
