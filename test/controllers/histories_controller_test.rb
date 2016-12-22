require 'test_helper'

class HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history = histories(:one)
    @user_for_tests = users(:user_for_tests)
  end

  test "should get index not admin" do
    post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }
    get histories_url
    assert_redirected_to root_path
  end

  test "should get new" do
    get new_history_url
    assert_response :success
  end

  test "should create history" do
    assert_difference('History.count') do
      post histories_url, params: { history: { owner: @history.owner, request: @history.request } }
    end

    assert_redirected_to history_url(History.last)
  end

  test "should show history" do
    get history_url(@history)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_url(@history)
    assert_response :success
  end

  test "should update history" do
    patch history_url(@history), params: { history: { owner: @history.owner, request: @history.request } }
    assert_redirected_to history_url(@history)
  end

  test "should destroy history" do
    post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }
    assert_difference('History.count', -1) do
      delete history_url(@history)
    end

    assert_redirected_to root_path
  end
end
