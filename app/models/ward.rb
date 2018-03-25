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
   generate_token(:ward_token)
	end

	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Ward.exists?(column => self[column])
  end
end
