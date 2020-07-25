require 'test_helper'

class PatientRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get patient_records_new_url
    assert_response :success
  end

  test "should get edit" do
    get patient_records_edit_url
    assert_response :success
  end

end
