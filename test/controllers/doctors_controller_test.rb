require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get doctors_url
    assert_response :success
  end

  test "should get new" do
    get new_doctor_url
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post doctors_url, params: { doctor: { address1: @doctor.address1, address2: @doctor.address2, address3: @doctor.address3, address4: @doctor.address4, email: @doctor.email, fname: @doctor.fname, hname: @doctor.hname, lname: @doctor.lname, password: 'secret', password_confirmation: 'secret', phone: @doctor.phone, role: @doctor.role, roomno: @doctor.roomno, specialisation: @doctor.specialisation, title: @doctor.title, wardno: @doctor.wardno } }
    end

    assert_redirected_to doctor_url(Doctor.last)
  end

  test "should show doctor" do
    get doctor_url(@doctor)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctor_url(@doctor)
    assert_response :success
  end

  test "should update doctor" do
    patch doctor_url(@doctor), params: { doctor: { address1: @doctor.address1, address2: @doctor.address2, address3: @doctor.address3, address4: @doctor.address4, email: @doctor.email, fname: @doctor.fname, hname: @doctor.hname, lname: @doctor.lname, password: 'secret', password_confirmation: 'secret', phone: @doctor.phone, role: @doctor.role, roomno: @doctor.roomno, specialisation: @doctor.specialisation, title: @doctor.title, wardno: @doctor.wardno } }
    assert_redirected_to doctor_url(@doctor)
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete doctor_url(@doctor)
    end

    assert_redirected_to doctors_url
  end
end
