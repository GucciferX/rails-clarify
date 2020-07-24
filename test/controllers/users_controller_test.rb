require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get coaches" do
    get users_coaches_url
    assert_response :success
  end

  test "should get patients" do
    get users_patients_url
    assert_response :success
  end

end
