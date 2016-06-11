require 'test_helper'

module Api::V1
  class UsersControllerTest < ActionDispatch::IntegrationTest
    setup do
      @chris = users(:chris)
    end

    test "should get index" do
      get api_users_url
      assert_response :success
    end

    test "should create user if parameters valid" do
      @bob = User.new(username: "bob", birthdate: 18.years.ago - 1.day, height: 160, age_min: 18, age_max: 99)
      params = {}
      params[:user] = @bob.attributes
      params[:user][:password] = "bob"
      params[:user][:password_confirmation] = "bob"
      
      assert_difference('User.count') do
        post api_users_url, params: params
      end
      
      assert_response 201
    end

    test "should not create user if parameters invalid" do
     @bob = User.new(username: "bob/", birthdate: 18.years.ago, height: 301, age_min: 17, age_max: 100)
      
      assert_difference('User.count', 0) do
        post api_users_url, params: { user: @chris.attributes }
      end
      
      assert_response :unprocessable_entity
    end

    test "should show user" do
      get api_user_url(@chris)
      assert_response :success
    end

    test "should update user if parameters valid" do
      patch api_user_url(@chris), params: { user: @chris.attributes }
      assert_response 200
    end

    test "should not update user if parameters invalid" do
      @chris.username = nil
      
      patch api_user_url(@chris), params: { user: @chris.attributes }
      
      assert_response :unprocessable_entity
    end

    test "should destroy user" do
      assert_difference('User.count', -1) do
        delete api_user_url(@chris)
      end
      
      assert_response 204
    end
  end
end
