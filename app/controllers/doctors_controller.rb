class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    authorize! :create, Doctor
    hospital = Hospital.find(params[:hospital_id])
    @doctors = hospital.doctors
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @patient = @doctor.patients.where("patients.consutation = ?", Date.today).search(params[:search])
  end

  # GET /doctors/new
  def new
    authorize! :create, Doctor
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards
    @doctor = hospital.doctors.build
  end

  # GET /doctors/1/edit
  def edit
    authorize! :update, Doctor
  end

  # POST /doctors
  # POST /doctors.json
  def create
    authorize! :create, Doctor
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards
    @doctor = hospital.doctors.create(doctor_params)
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to hospital_path(hospital.id), notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to hospital_doctor_path(@doctor.hospital_id, @doctor), notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to hospital_doctors_path, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      hospital = Hospital.find(params[:hospital_id])
      @doctor = hospital.doctors.find(params[:id])
      @ward = hospital.wards
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:fname, :lname, :email, :title, :address1, :address2, :address3, :address4, :address, :phone, :roomno, :role, :specialisation, :hname, :password, :password_confirmation, :hospital_id, :ward_id)
    end
end
