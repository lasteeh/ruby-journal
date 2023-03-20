require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  
    setup do
        @category1 = categories(:one)
        @category2 = categories(:two)
      end

    test "should get index" do
        get categories_url
        assert_response :success
    end

    test 'should show category' do
        get category_show_url(@category1)
        assert_response :success
    end

    test 'should get edit' do
        get category_edit_url(@category1)    
        assert_response :success
    end

    test 'should update' do
        patch category_update_url(@category1), params: { category: { name: 'one' }}
        assert_redirected_to categories_path
    end
end
