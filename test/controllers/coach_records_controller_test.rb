require 'test_helper'

class CoachRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get coach_records_new_url
    assert_response :success
  end

  test "should get edit" do
    get coach_records_edit_url
    assert_response :success
  end

end
