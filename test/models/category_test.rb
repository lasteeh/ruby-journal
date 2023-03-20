require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without a name" do
    category = Category.new(name: "")
    
    assert_not category.save, "saved without category name"
  end

  test "should not save category with duplicate name" do
    category1 = Category.create(name: "Test Category")
    category2 = Category.new(name: "Test Category")
  
    assert_not category2.save, "Saved category with duplicate name"
  end
end
