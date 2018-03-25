json.extract! patient, :id, :fname, :lname, :birthdate, :address1, :address2, :address3, :address4, :address, :title, :consutation, :phone, :bloodtype, :nextname, :nextphone, :nextaddress1, :nextaddress2, :nextaddress3, :nextaddress4, :nextaddress, :ralationship, :hospital_id, :ward_id, :doctor_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
