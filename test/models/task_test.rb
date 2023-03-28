require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @task = tasks(:task1)
    @category1 = categories(:category1)
    @category2 = categories(:category2)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "description should be present" do
    @task.description = " "
    assert_not @task.valid?
  end

  test "user_id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
  
  test "can have 1 category" do
    @task.categories << @category1
    assert_equal 1, @task.categories.count
  end

  test "can have multiple categories" do
    @task.categories << @category1
    @task.categories << @category2
    assert_equal 2, @task.categories.count
  end

  test "completed should default to false" do
    @task.completed = nil
    assert_not @task.completed?
  end

end
