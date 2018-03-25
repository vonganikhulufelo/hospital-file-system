class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Administrator.find_by(email: params[:email])
    recept = Receptionist.find_by(email: params[:email])
    nurse = Nurse.find_by(email: params[:email])
     doctor = Doctor.find_by(email: params[:email])
      pharmacist = Pharmacist.find_by(email: params[:email])

    if admin && admin.authenticate(params[:password])
      log_in admin
      redirect_to hospital_path(admin.hospital_id)

    elsif recept && recept.authenticate(params[:password])
      log_in recept
      redirect_to hospital_patients_path(recept.hospital_id)

    elsif nurse && nurse.authenticate(params[:password])
      log_in nurse
      redirect_to hospital_ward_path(nurse.hospital_id, nurse.ward_id)

    elsif doctor && doctor.authenticate(params[:password])
      log_in doctor
      redirect_to hospital_doctor_path(doctor.hospital_id, doctor.id)

    elsif pharmacist && pharmacist.authenticate(params[:password])
      log_in pharmacist
      redirect_to hospital_pharmacyrecords_path(pharmacist.hospital_id)
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
      log_out
      session.delete(:user_id)
      redirect_to root_path
  end
end
