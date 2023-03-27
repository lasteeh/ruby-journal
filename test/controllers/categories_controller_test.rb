require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  
    # setup do
    #     @category1 = categories(:one)
    #     @category2 = categories(:two)
    #   end

    # test "should get index" do
    #     get categories_url
    #     assert_response :success
    # end

    # test 'should show category' do
    #     get category_show_url(@category1)
    #     assert_response :success
    # end

    # test 'should get edit' do
    #     get category_edit_url(@category1)    
    #     assert_response :success
    # end

    # test 'should update' do
    #     patch category_update_url(@category1), params: { category: { name: 'one' }}
    #     assert_redirected_to categories_path
    # end

    # setup do
    #     @user = users(:one) 
    #     @category = categories(:one) 
    #     @category_params = { name: "New Category", description: "New Category Description" }
    #   end
    
    #   test "should get index" do
    #     sign_in_as(@user) 
    #     get categories_url
    #     assert_response :success
    #   end
    
    #   test "should get new" do
    #     sign_in_as(@user)
    #     get new_category_url
    #     assert_response :success
    #   end
    
    #   test "should create category" do
    #     sign_in_as(@user)
    #     assert_difference('Category.count') do
    #       post categories_url, params: { category: @category_params }
    #     end
    
    #     assert_redirected_to categories_url
    #     assert_equal 'Category successfully created', flash[:notice]
    #   end
    
    #   test "should show category" do
    #     sign_in_as(@user)
    #     get category_url(@category)
    #     assert_response :success
    #   end
    
    #   test "should get edit" do
    #     sign_in_as(@user)
    #     get edit_category_url(@category)
    #     assert_response :success
    #   end
    
    #   test "should update category" do
    #     sign_in_as(@user)
    #     patch category_url(@category), params: { category: @category_params }
    #     assert_redirected_to categories_url
    #     assert_equal 'Category successfully updated', flash[:notice]

    #   end
    
    #   test "should destroy category" do
    #     sign_in_as(@user)
    #     assert_difference('Category.count', -1) do
    #       delete category_url(@category)
    #     end
    
    #     assert_redirected_to categories_url
    #     assert_equal 'Category successfully destroyed', flash[:notice]
    #   end
    

    
    #   private
    
    #   def sign_in_as(user)
    #     post login_url, params: { session: { email: user.email, password: 'password' } }
    #   end
end
