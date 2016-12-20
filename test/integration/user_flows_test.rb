require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @user_for_tests = users(:user_for_tests)
  end

  test 'sign up' do
    post user_registration_path, params:
      { 'user[email]' => 'email@example.com',
        'user[password]' => 'password',
        'user[password_confirmation]' => 'password' }

    assert_redirected_to root_path

    assert User.find_by_email('email@example.com')
  end

  test 'fail sign up' do
    post user_registration_path, params:
      { 'user[email]' => 'email@example.com',
        'user[password]' => 'password',
        'user[password_confirmation]' => 'password1' }

    assert_response :success # Controller didn't redirect to root_path
  end
end