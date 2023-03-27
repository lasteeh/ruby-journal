require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = categories(:category1)
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "user_id should be present" do
    @category.user_id = nil
    assert_not @category.valid?
  end

  test "favorite should default to false" do
    assert_not @category.favorite?
  end
end
