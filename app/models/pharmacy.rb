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
 	 generate_token(:pharmacy_token)
	end

	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Pharmacy.exists?(column => self[column])
  end
end
