class PatientPdf < Prawn::Document
   def initialize(patient)
    super(top_margin: 70)
    @patients = patient
     hospital_name
      patient_records
   
  end

  def hospital_name
    text "#{@patients.hname} Patient Report", size: 30, style: :bold, text_align: :center
    move_down 20
    text "Patient Details", size: 25, style: :bold
     move_down 20
    text "Firsnt Name: #{@patients.fname}", size: 20
    text "Last Name: #{@patients.lname}", size: 20
    text "Birth Date: #{@patients.birthdate.strftime("%d %B %Y")}", size: 20
    text "Title: #{@patients.title}", size: 20
    text "Address: #{@patients.address}", size: 20
    text "Phone: #{@patients.phone}", size: 20
     text "Registration Date: #{@patients.created_at.strftime("%d %B %Y")}", size: 20
    text "Blood Type: #{@patients.bloodtype}", size: 20
    text "Ward Name: #{@patients.wname}", size: 20
    text "Doctor Name: #{@patients.dname}", size: 20
    text "Next Consultation: #{@patients.consutation.strftime("%d %B %Y, %H:%m")}", size: 20
    move_down 20
    text "Patient Records", size: 25, style: :bold
  end

 
  
  def patient_records
    move_down 20
    table line_items do
    row(0).font_style = :bold
    columns(1..3).align = :right
    self.row_colors = ["DDDDDD", "FFFFFF"]
    self.header = true
  end
  end

  def line_items
    [["Age", "Bp", "heartrate", "Weight","illiness","prescription", "drugcollected","Visited"]] +
    @patients.patientrecords.map do |patient|
      [patient.age.to_s, patient.bp.to_s, patient.heartrate.to_s,patient.weight.to_s, patient.illness.to_s, patient.prescription.to_s, patient.drugcollected.to_s,patient.created_at.strftime("%d %B %Y").to_s]
    end
  end
end