require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should create user if parameters valid" do
    assert_difference('User.count') do
      post users_url, params: { user: @user.attributes }
    end

    assert_response 201
  end
  
  test "should not create user if parameters invalid" do
    @user.username = nil
    
    assert_raises(ActiveRecord::StatementInvalid) { post users_url, params: { user: @user.attributes } }
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should update user if parameters valid" do
    patch user_url(@user), params: { user: @user.attributes }
    assert_response 200
  end
  
  test "should not update user if parameters invalid" do
    @user.username = nil
    
    assert_raises(ActiveRecord::StatementInvalid) { patch user_url(@user), params: { user: @user.attributes } }
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_response 204
  end
end
