require 'test_helper'

class PharmacyrecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pharmacyrecord = pharmacyrecords(:one)
  end

  test "should get index" do
    get pharmacyrecords_url
    assert_response :success
  end

  test "should get new" do
    get new_pharmacyrecord_url
    assert_response :success
  end

  test "should create pharmacyrecord" do
    assert_difference('Pharmacyrecord.count') do
      post pharmacyrecords_url, params: { pharmacyrecord: { collected: @pharmacyrecord.collected, hospital_id: @pharmacyrecord.hospital_id } }
    end

    assert_redirected_to pharmacyrecord_url(Pharmacyrecord.last)
  end

  test "should show pharmacyrecord" do
    get pharmacyrecord_url(@pharmacyrecord)
    assert_response :success
  end

  test "should get edit" do
    get edit_pharmacyrecord_url(@pharmacyrecord)
    assert_response :success
  end

  test "should update pharmacyrecord" do
    patch pharmacyrecord_url(@pharmacyrecord), params: { pharmacyrecord: { collected: @pharmacyrecord.collected, hospital_id: @pharmacyrecord.hospital_id } }
    assert_redirected_to pharmacyrecord_url(@pharmacyrecord)
  end

  test "should destroy pharmacyrecord" do
    assert_difference('Pharmacyrecord.count', -1) do
      delete pharmacyrecord_url(@pharmacyrecord)
    end

    assert_redirected_to pharmacyrecords_url
  end
end
