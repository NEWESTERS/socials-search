require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get top_all_url
    assert_response :success
  end

  test "should get hour" do
    get top_hour_url
    assert_response :success
  end

  test "should get day" do
    get top_day_url
    assert_response :success
  end

  test "should get week" do
    get top_week_url
    assert_response :success
  end

  test "should get month" do
    get top_month_url
    assert_response :success
  end

end
