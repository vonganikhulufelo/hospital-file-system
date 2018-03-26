class Pharmacy < ApplicationRecord
  belongs_to :hospital
  belongs_to :ward
  has_many :pharmacists, dependent: :destroy
  before_save :addaddress

  def addaddress
 	 hospital = Hospital.find(self.hospital_id)
 	 self.hname = hospital.hname
 	 hospital.save
 	 ward = Ward.find(self.ward_id)
 	 self.wname = ward.wname
 	 ward.save
	end
end
