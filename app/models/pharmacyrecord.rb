class Pharmacyrecord < ApplicationRecord
  belongs_to :hospital

  before_save :addaddress

  def addaddress
 	 patientrecord = Patientrecord.find(self.prid)
 	 patientrecord.drugcollected = self.collected
 	 patientrecord.save
 	 generate_token(:auth_token)
	end

	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Pharmacyrecord.exists?(column => self[column])
  end
end
