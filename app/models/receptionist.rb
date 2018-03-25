class Receptionist < ApplicationRecord
  belongs_to :hospital
  belongs_to :ward
  has_secure_password
  before_save :addaddress

  regex = /^\+(?:[0-9] ?){6,14}[0-9]$/
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
validates :phone, presence: true, format: { with: regex, :multiline => true }
validates :fname, :lname,:address1,:address2, :address4, :title, presence: true

  def addaddress
 	 self.address = [self.address1, self.address2, self.address3, self.address4].compact.join(', ')
 	 self.role = "receptionist"
 	 hospital = Hospital.find(self.hospital_id)
 	 self.hname = hospital.hname
 	 hospital.save
 	 ward = Ward.find(self.ward_id)
 	 self.wname = ward.wname
 	 ward.save
 	 generate_token(:receptionist_token)
	end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Receptionist.exists?(column => self[column])
  end
end
