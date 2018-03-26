class Pharmacyrecord < ApplicationRecord
  belongs_to :hospital

  before_save :addaddress

  def addaddress
 	 patientrecord = Patientrecord.find(self.prid)
 	 patientrecord.drugcollected = self.collected
 	 patientrecord.save
	end
end
