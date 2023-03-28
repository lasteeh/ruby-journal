require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # def setup
  #   @user = User.new(username: "testuser", email: "testuser@example.com", password: "password")
  # end

  def setup
    @user = users(:user1)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be invalid without username" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "should be invalid without email" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "should be invalid without valid password" do
    @user.email = "pass"
    assert_not @user.valid?
  end

  test "password should be encrypted" do
    assert_not_equal "password1", @user.password
  end

end
