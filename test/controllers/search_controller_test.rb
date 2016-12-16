# -*- encoding : utf-8 -*-
require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get search_input_url
    assert_response :success
  end

  test "should get view" do
    get search_view_url
    assert_response :success
  end

end
