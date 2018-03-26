class Ward < ApplicationRecord
  belongs_to :hospital
  has_many :patients
  has_many :doctors
  has_many :pharmacists
  has_many :receptionists, dependent: :destroy
  has_many :pharmacies
  before_save :addaddress

  def addaddress
 	 hospital = Hospital.find(self.hospital_id)
 	 self.hname = hospital.hname
 	 hospital.save
	end
end
