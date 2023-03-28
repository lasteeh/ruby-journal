require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = categories(:category1)
    @task1 = tasks(:task1)
    @task2 = tasks(:task2)
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
    @category.favorite = nil
    assert_not @category.favorite?
  end

  test "can have 1 task" do
    @category.tasks << @task1
    assert_equal 1, @category.tasks.count
  end

  test "can have multiple tasks" do
    @category.tasks << @task1
    @category.tasks << @task2
    assert_equal 2, @category.tasks.count
  end
end
