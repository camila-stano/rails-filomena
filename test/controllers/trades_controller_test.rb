require 'test_helper'

class TradesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trades_index_url
    assert_response :success
  end

  test "should get new" do
    get trades_new_url
    assert_response :success
  end

  test "should get create" do
    get trades_create_url
    assert_response :success
  end

  test "should get show" do
    get trades_show_url
    assert_response :success
  end

  test "should get edit" do
    get trades_edit_url
    assert_response :success
  end

  test "should get update" do
    get trades_update_url
    assert_response :success
  end

end
