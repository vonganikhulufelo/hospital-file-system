require 'test_helper'

class PharmacistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pharmacist = pharmacists(:one)
  end

  test "should get index" do
    get pharmacists_url
    assert_response :success
  end

  test "should get new" do
    get new_pharmacist_url
    assert_response :success
  end

  test "should create pharmacist" do
    assert_difference('Pharmacist.count') do
      post pharmacists_url, params: { pharmacist: { address1: @pharmacist.address1, address2: @pharmacist.address2, address3: @pharmacist.address3, address4: @pharmacist.address4, email: @pharmacist.email, fname: @pharmacist.fname, hname: @pharmacist.hname, lname: @pharmacist.lname, password: 'secret', password_confirmation: 'secret', pharmacyno: @pharmacist.pharmacyno, phone: @pharmacist.phone, role: @pharmacist.role, title: @pharmacist.title, wardno: @pharmacist.wardno } }
    end

    assert_redirected_to pharmacist_url(Pharmacist.last)
  end

  test "should show pharmacist" do
    get pharmacist_url(@pharmacist)
    assert_response :success
  end

  test "should get edit" do
    get edit_pharmacist_url(@pharmacist)
    assert_response :success
  end

  test "should update pharmacist" do
    patch pharmacist_url(@pharmacist), params: { pharmacist: { address1: @pharmacist.address1, address2: @pharmacist.address2, address3: @pharmacist.address3, address4: @pharmacist.address4, email: @pharmacist.email, fname: @pharmacist.fname, hname: @pharmacist.hname, lname: @pharmacist.lname, password: 'secret', password_confirmation: 'secret', pharmacyno: @pharmacist.pharmacyno, phone: @pharmacist.phone, role: @pharmacist.role, title: @pharmacist.title, wardno: @pharmacist.wardno } }
    assert_redirected_to pharmacist_url(@pharmacist)
  end

  test "should destroy pharmacist" do
    assert_difference('Pharmacist.count', -1) do
      delete pharmacist_url(@pharmacist)
    end

    assert_redirected_to pharmacists_url
  end
end
