require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_for_tests = users(:user_for_tests)
  end
  test "should get profile" do
  	post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }
    get users_profile_url
    assert_response :success
  end

end
