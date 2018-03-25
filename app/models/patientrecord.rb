class Patientrecord < ApplicationRecord
  belongs_to :patient
   before_save :addaddress

  def addaddress
 	 patient = Patient.find(self.patient_id)
 	 patient.consutation = self.consultation
 	 patient.save
	end
end
