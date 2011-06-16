require 'test_helper'

class PermissionTest < MiniTest::Unit::TestCase

  def setup 
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

    @nncode = "nonsense.administrate"
    @nnname = "Administrate Nonsense"
    @nncategory = "Nonsense"
    @nnp = Permission.new
    @nnp.code = @nncode
    @nnp.name = @nnname
    @nnp.category = @nnpcategory
  end

  def test_creation_and_grouping
    assert_equal "Testing", @trp.category
    assert_equal @trp.category, @tap.category
  end

  def test_parenting
    assert_equal @tap, @trp.parent
  end

  def test_sorting_for_text
    assert_equal @tap, [@trp, @tap].sort{|q,w| q.sort_text(w)}.first
  end

  #TODO: write users test -- it needs some legit fixtures/mocks
end

