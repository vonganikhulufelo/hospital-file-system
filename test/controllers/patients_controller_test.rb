require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post patients_url, params: { patient: { address1: @patient.address1, address2: @patient.address2, address3: @patient.address3, address4: @patient.address4, address: @patient.address, birthdate: @patient.birthdate, bloodtype: @patient.bloodtype, consutation: @patient.consutation, doctor_id: @patient.doctor_id, fname: @patient.fname, hospital_id: @patient.hospital_id, lname: @patient.lname, nextaddress1: @patient.nextaddress1, nextaddress2: @patient.nextaddress2, nextaddress3: @patient.nextaddress3, nextaddress4: @patient.nextaddress4, nextaddress: @patient.nextaddress, nextname: @patient.nextname, nextphone: @patient.nextphone, phone: @patient.phone, ralationship: @patient.ralationship, title: @patient.title, ward_id: @patient.ward_id } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { address1: @patient.address1, address2: @patient.address2, address3: @patient.address3, address4: @patient.address4, address: @patient.address, birthdate: @patient.birthdate, bloodtype: @patient.bloodtype, consutation: @patient.consutation, doctor_id: @patient.doctor_id, fname: @patient.fname, hospital_id: @patient.hospital_id, lname: @patient.lname, nextaddress1: @patient.nextaddress1, nextaddress2: @patient.nextaddress2, nextaddress3: @patient.nextaddress3, nextaddress4: @patient.nextaddress4, nextaddress: @patient.nextaddress, nextname: @patient.nextname, nextphone: @patient.nextphone, phone: @patient.phone, ralationship: @patient.ralationship, title: @patient.title, ward_id: @patient.ward_id } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
