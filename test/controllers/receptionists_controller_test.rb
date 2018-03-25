require 'test_helper'

class ReceptionistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receptionist = receptionists(:one)
  end

  test "should get index" do
    get receptionists_url
    assert_response :success
  end

  test "should get new" do
    get new_receptionist_url
    assert_response :success
  end

  test "should create receptionist" do
    assert_difference('Receptionist.count') do
      post receptionists_url, params: { receptionist: { address1: @receptionist.address1, address2: @receptionist.address2, address3: @receptionist.address3, address4: @receptionist.address4, email: @receptionist.email, fname: @receptionist.fname, hname: @receptionist.hname, lname: @receptionist.lname, password: 'secret', password_confirmation: 'secret', pharmacyno: @receptionist.pharmacyno, phone: @receptionist.phone, role: @receptionist.role, title: @receptionist.title, wardno: @receptionist.wardno } }
    end

    assert_redirected_to receptionist_url(Receptionist.last)
  end

  test "should show receptionist" do
    get receptionist_url(@receptionist)
    assert_response :success
  end

  test "should get edit" do
    get edit_receptionist_url(@receptionist)
    assert_response :success
  end

  test "should update receptionist" do
    patch receptionist_url(@receptionist), params: { receptionist: { address1: @receptionist.address1, address2: @receptionist.address2, address3: @receptionist.address3, address4: @receptionist.address4, email: @receptionist.email, fname: @receptionist.fname, hname: @receptionist.hname, lname: @receptionist.lname, password: 'secret', password_confirmation: 'secret', pharmacyno: @receptionist.pharmacyno, phone: @receptionist.phone, role: @receptionist.role, title: @receptionist.title, wardno: @receptionist.wardno } }
    assert_redirected_to receptionist_url(@receptionist)
  end

  test "should destroy receptionist" do
    assert_difference('Receptionist.count', -1) do
      delete receptionist_url(@receptionist)
    end

    assert_redirected_to receptionists_url
  end
end
