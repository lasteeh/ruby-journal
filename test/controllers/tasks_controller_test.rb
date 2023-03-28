require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

    setup do
        @task = tasks(:task1)
        @user = users(:user1)
        sign_in_as(@user, 'password1')
    end
  

    test "should get index" do
        get tasks_url
        assert_response :success
    end

    test 'should show task' do
        get task_show_url(@task)
        assert_response :success
    end

    test 'should get edit' do
        get task_edit_url(@task)    
        assert_response :success
    end

    test 'should update' do
        patch task_update_url(@task), params: { task: { name: 'one' }}
        assert_redirected_to tasks_path
    end

    
      test "should get new" do
        get tasks_new_url
        assert_response :success
      end
    
      test "should create task" do
        assert_difference('Task.count') do
          post tasks_url, params: { task: {description: "test task name"} }
        end
    
        assert_redirected_to tasks_url
      end
    
    
      test "should destroy task" do
        delete task_delete_path(@task)
        assert_redirected_to tasks_path
        assert_not Task.exists?(@task.id)
      end

      test "completion can be toggled on or off" do
        previous_page = tasks_url
        put task_complete_path(@task), headers: { 'HTTP_REFERER' => previous_page }
        assert_equal !@task.completed, @task.reload.completed

        assert_response :redirect
        follow_redirect!
        assert_response :success
      end

end
