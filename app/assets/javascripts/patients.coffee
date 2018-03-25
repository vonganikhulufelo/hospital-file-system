# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $('#patient_doctor_id').parent().hide()
  doctors = $('#patient_doctor_id').html()
  $('#patient_ward_id').change ->
    ward = $('#patient_ward_id :selected').text()
    options = $(doctors).filter("optgroup[label=#{ward}]").html()
    console.log(options)
    if options
      $('#patient_doctor_id').html(options)
      $('#patient_doctor_id').parent().show()      
    else
      $('#patient_doctor_id').empty()
      $('#patient_doctor_id').parent().hide()