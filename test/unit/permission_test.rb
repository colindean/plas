require 'test_helper'

class PermissionTest < ActiveSupport::TestCase

  setup do
    @tacode = "tests.administrate"
    @taname = "Administrate Tests"
    @tacategory = "Testing"

    @trcode = "tests.run"
    @trname ="Run Tests"
    @trcategory = "Testing"

    @tap = Permission.new
    @tap.code = @tacode
    @tap.name = @taname
    @tap.category = @tacategory

    @trp = Permission.new
    @trp.code = @trcode
    @trp.name = @trname
    @trp.category = @trcategory

    @trp.parent = @tap

  end

  test "creation and grouping" do
    assertEquals("Testing", @trp.category)
    assertEquals(@trp.category, @tap.category)

  end

  test "parenting" do
    assertEquals(@tap, @trp.parent)
  end

  #TODO: write users test -- it needs some legit fixtures/mocks
end
