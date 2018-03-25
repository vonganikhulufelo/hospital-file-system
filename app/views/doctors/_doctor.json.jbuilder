json.extract! doctor, :id, :fname, :lname, :email, :title, :address1, :address2, :address3, :address4, :phone, :wardno, :roomno, :role, :specialisation, :hname, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
