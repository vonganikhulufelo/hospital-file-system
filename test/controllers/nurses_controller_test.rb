require 'test_helper'

class NursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nurse = nurses(:one)
  end

  test "should get index" do
    get nurses_url
    assert_response :success
  end

  test "should get new" do
    get new_nurse_url
    assert_response :success
  end

  test "should create nurse" do
    assert_difference('Nurse.count') do
      post nurses_url, params: { nurse: { address1: @nurse.address1, address2: @nurse.address2, address3: @nurse.address3, address4: @nurse.address4, email: @nurse.email, fname: @nurse.fname, hname: @nurse.hname, lname: @nurse.lname, password: 'secret', password_confirmation: 'secret', phone: @nurse.phone, role: @nurse.role, roomno: @nurse.roomno, specialisation: @nurse.specialisation, title: @nurse.title, wardno: @nurse.wardno } }
    end

    assert_redirected_to nurse_url(Nurse.last)
  end

  test "should show nurse" do
    get nurse_url(@nurse)
    assert_response :success
  end

  test "should get edit" do
    get edit_nurse_url(@nurse)
    assert_response :success
  end

  test "should update nurse" do
    patch nurse_url(@nurse), params: { nurse: { address1: @nurse.address1, address2: @nurse.address2, address3: @nurse.address3, address4: @nurse.address4, email: @nurse.email, fname: @nurse.fname, hname: @nurse.hname, lname: @nurse.lname, password: 'secret', password_confirmation: 'secret', phone: @nurse.phone, role: @nurse.role, roomno: @nurse.roomno, specialisation: @nurse.specialisation, title: @nurse.title, wardno: @nurse.wardno } }
    assert_redirected_to nurse_url(@nurse)
  end

  test "should destroy nurse" do
    assert_difference('Nurse.count', -1) do
      delete nurse_url(@nurse)
    end

    assert_redirected_to nurses_url
  end
end
