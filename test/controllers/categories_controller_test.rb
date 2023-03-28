require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    setup do
        @category = categories(:category1)
        @user = users(:user1)
        sign_in_as(@user, 'password1')
    end
  

    test "should get index" do
        get categories_url
        assert_response :success
    end

    test 'should show category' do
        get category_show_url(@category)
        assert_response :success
    end

    test 'should get edit' do
        get category_edit_url(@category)    
        assert_response :success
    end

    test 'should update' do
        patch category_update_url(@category), params: { category: { name: 'one' }}
        assert_redirected_to categories_path
    end

    
      test "should get new" do
        get categories_new_url
        assert_response :success
      end
    
      test "should create category" do
        assert_difference('Category.count') do
          post categories_url, params: { category: {name: "test category name"} }
        end
    
        assert_redirected_to categories_url
      end
    
    
      test "should destroy category" do
        delete category_delete_path(@category)
        assert_redirected_to categories_path
        assert_not Category.exists?(@category.id)
      end

      test "favorite can be toggled on or off" do
        put category_favorite_path(@category)
        assert_equal !@category.favorite, @category.reload.favorite
        assert_redirected_to category_show_path
      end
    
end
