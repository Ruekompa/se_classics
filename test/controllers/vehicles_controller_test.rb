require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vehicles_index_url
    assert_response :success
  end

  test "should get show" do
    get vehicles_show_url
    assert_response :success
  end

  test "should get new" do
    get vehicles_new_url
    assert_response :success
  end

  test "should get edit" do
    get vehicles_edit_url
    assert_response :success
  end

end
