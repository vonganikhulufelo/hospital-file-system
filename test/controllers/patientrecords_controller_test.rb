require 'test_helper'

class PatientrecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get patientrecords_edit_url
    assert_response :success
  end

  test "should get index" do
    get patientrecords_index_url
    assert_response :success
  end

  test "should get new" do
    get patientrecords_new_url
    assert_response :success
  end

  test "should get show" do
    get patientrecords_show_url
    assert_response :success
  end

end
