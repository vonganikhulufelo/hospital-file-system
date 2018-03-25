class Hospital < ApplicationRecord
before_save :addaddress
has_many :administrators
has_many :nurses
has_many :doctors, dependent: :destroy
has_many :patients
has_many :wards
has_many :pharmacies
has_many :pharmacyrecords
has_many :pharmacists, dependent: :destroy
has_many :receptionists
	
	def addaddress
 	 self.haddress = [self.haddress1, self.haddress2, self.haddress3, self.haddresscode].compact.join(', ')
 	 generate_token(:hospital_token)
	end
def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Hospital.exists?(column => self[column])
  end
	
end