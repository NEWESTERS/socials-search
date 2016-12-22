require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @user_for_tests = users(:user_for_tests)
    @test_req = 'request'
    @admin = users(:admin)
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

  test 'sign in and add to history' do
    post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }
    get search_view_url( :new => 'true', :start => '1', :str => @test_req )
    assert History.where( owner: @user_for_tests.email, request: @test_req )
  end

  test 'fail not admin to administrate' do
    post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }

    assert_redirected_to root_path

    get '/histories'

    assert_redirected_to root_path
  end

  test 'admin to administrate' do
    post user_session_path, params:
      { 'user[email]' => @admin.email,
        'user[password]' => 'adminPassword' }

    assert_redirected_to root_path

    get '/histories'

    assert_response :success
  end

  test 'fail to destroy strangers history' do
    post user_session_path, params:
      { 'user[email]' => @admin.email,
        'user[password]' => 'adminPassword' }

    get search_view_url( :new => 'true', :start => '1', :str => @test_req )

    delete destroy_user_session_path

    post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }

    assert_difference('History.count', 0) do
      delete "/histories/#{ History.find_by( owner: @admin.email, request: @test_req ).id }"
    end
  end

  test 'destroy self history' do
    post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }

    get search_view_url( :new => 'true', :start => '1', :str => @test_req )

    assert_difference('History.count', -1) do
      delete "/histories/#{ History.find_by( owner: @user_for_tests.email, request: @test_req ).id }"
    end
  end
end