require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

    setup do
        @user = users(:user1)
        # sign_in_as(@user, 'password1')
    end
  

    test "should get login page" do
        get login_url
        assert_response :success
    end


    test 'should login' do
        sign_in_as(@user, 'password1')
        get app_url
        assert_response :success
    end

    test 'should sign out' do
        delete logout_path
        assert_redirected_to root_url
    end

    
end
