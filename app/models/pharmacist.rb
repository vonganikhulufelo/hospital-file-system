class Pharmacist < ApplicationRecord
  belongs_to :hospital
  belongs_to :ward
  belongs_to :pharmacy
  has_secure_password
  before_save :addaddress

  regex = /^\+(?:[0-9] ?){6,14}[0-9]$/
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :fname, :lname,:address1,:address2, :address4, :title, presence: true
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
validates :phone, presence: true, format: { with: regex, :multiline => true }

  def addaddress
 	 self.address = [self.address1, self.address2, self.address3, self.address4].compact.join(', ')
 	 self.role = "pharmacist"
 	 hospital = Hospital.find(self.hospital_id)
 	 self.hname = hospital.hname
 	 hospital.save
 	 ward = Ward.find(self.ward_id)
 	 self.wname = ward.wname
 	 ward.save
   pharmacy = Pharmacy.find(self.pharmacy_id)
   self.pharmacyname = pharmacy.pharmacyname
   pharmacy.save
   generate_token(:pharmacist_token)
	end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Pharmacist.exists?(column => self[column])
  end
end
