# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Hospital.create!(hname: 'George Mkharhi Hospital',htellphone: '+124748565', haddress1: '328 minnaar Street',haddress2: '91 Parkbarg',haddresscode: '0001')
Administrator.create!(fname: 'vongani', lname: 'Mahumani',title:'Mr',email: 'vongani@gmail.com',phone: '+783338706',address1: 'Limpopo', address2: 'Giyani',address4: '0826',  officeno: '5532', password: '12', password_confirmation: '12',hospital_id: '1')
Ward.create!(wname: 'Geriatrics',wardno: '20', hospital_id: '1')
Ward.create!(wname: 'Maternity',wardno: '21', hospital_id: '1')
Ward.create!(wname: 'Psychiatric',wardno: '22', hospital_id: '1')
Ward.create!(wname: 'Pediatrics',wardno: '23', hospital_id: '1')
Pharmacy.create!(pharmacyname: 'Geriatrics pharmacy',pahrmacyno: '200', hospital_id: '1', ward_id: '1')
Pharmacy.create!(pharmacyname: 'Psychiatric pharmacy',pahrmacyno: '201', hospital_id: '1', ward_id: '3')
Pharmacy.create!(pharmacyname: 'Maternity pharmacy',pahrmacyno: '203', hospital_id: '1', ward_id: '2')
Pharmacy.create!(pharmacyname: 'Pediatrics pharmacy',pahrmacyno: '203', hospital_id: '1', ward_id: '4')
Pharmacist.create!(fname: 'Enough', lname: 'Nibengo',title:'Mr',email: 'enough@gmail.com',phone: '+7835555506',address1: 'Limpopo', address2: 'Xikhu,bha',address4: '0826', password: '12', password_confirmation: '12',hospital_id: '1', ward_id: '3', pharmacy_id: '2')
Receptionist.create!(fname: 'Thobi', lname: 'Zwane',title:'Mrs',email: 'thobi@gmail.com',phone: '+783338706',address1: 'Natal', address2: 'Durban',address4: '0526', password: '12', password_confirmation: '12',hospital_id: '1', ward_id: '3')
Nurse.create!(fname: 'Dee', lname: 'Magai',title:'Mr',email: 'dee@gmail.com',phone: '+783338706',address1: 'Jozi', address2: 'Dersvs',address4: '0826',  roomno: '5532', password: '12', password_confirmation: '12',hospital_id: '1', ward_id: '3')
Doctor.create!(fname: 'Dk', lname: 'Manganyi',title:'Mr',email: 'dk@gmail.com',phone: '+783338706',address1: 'Limpopo', address2: 'Giyani',address4: '0826',  roomno: '5532',specialisation: 'Medical', password: '12', password_confirmation: '12',hospital_id: '1', ward_id: '3')
Doctor.create!(fname: 'ma', lname: 'Manganyi',title:'Mr',email: 'mananyi@gmail.com',phone: '+783338706',address1: 'Limpopo', address2: 'Giyani',address4: '0826',  roomno: '5532',specialisation: 'Medical', password: '12', password_confirmation: '12',hospital_id: '1', ward_id: '3')
