class Patient < ApplicationRecord
  belongs_to :hospital
  belongs_to :ward
  belongs_to :doctor
  has_many :patientrecords
  before_update :addaddress
  mount_uploader :attachment, AttachmentUploader
regex = /^\+(?:[0-9] ?){6,14}[0-9]$/
validates :phone,:nextphone, presence: true, format: { with: regex, :multiline => true }
validates :fname, :lname,:birthdate,:address1,:address2, :address4, :title, :consutation, presence: true
validates :nextname, :nextaddress1,:nextaddress2,:nextaddress4,:ralationship, presence: true
validate :date_not_in_past
  def addaddress
 	 self.address = [self.address1, self.address2, self.address3, self.address4].compact.join(', ')
 	 self.nextaddress = [self.nextaddress1, self.nextaddress2, self.nextaddress3, self.nextaddress4].compact.join(', ')
 	 hospital = Hospital.find(self.hospital_id)
 	 self.hname = hospital.hname
 	 hospital.save
 	 ward = Ward.find(self.ward_id)
 	 self.wname = ward.wname
 	 ward.save
 	 doctor = Doctor.find(self.doctor_id)
 	 self.dname = doctor.lname
 	 doctor.save
	end
def self.search(search)
  		if search
    		where("fname LIKE ? OR lname LIKE ?", "%#{search}%","%#{search}%")
  		else
  			all
		end
	end

  def date_not_in_past
    if consutation.present? && consutation < Date.today
      errors.add(:consutation, "can't be in the past")
    end
  end
end
