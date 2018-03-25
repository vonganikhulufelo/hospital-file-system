class Administrator < ApplicationRecord
  belongs_to :hospital
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
 	 self.role = "administrator"
 	 hospital = Hospital.find(self.hospital_id)
 	 self.hname = hospital.hname
   self.hospital_token = hospital.hospital_token
 	 hospital.save
	end
  
	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Administrator.exists?(column => self[column])
  end

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  AdministratorMailer.password_reset(self).deliver
	end
end
