
class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    authorize! :update, Receptionist
    hospital = Hospital.find(params[:hospital_id])
    @patients = hospital.patients.search(params[:search])
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
     respond_to do |format|
    format.html
    format.pdf do
      pdf = PatientPdf.new(@patient)
      send_data pdf.render, filename: "#{@patient.hname}+#{@patient.lname}",
                              type: "application/pdf",
                              disposition: "inline"
                            end
                          end
  end

  # GET /patients/new
  def new
     authorize! :create, Patient
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards
    @patient = hospital.patients.build
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
     authorize! :create, Patient
    hospital = Hospital.find(params[:hospital_id])
     @ward = hospital.wards
    @patient = hospital.patients.create(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to hospital_patients_path, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to hospital_patients_path, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      hospital = Hospital.find(params[:hospital_id])
      @patient = hospital.patients.find(params[:id])
      @ward = hospital.wards
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:fname, :lname, :birthdate, :address1, :address2, :address3, :address4, :address, :title, :consutation, :phone, :bloodtype, :nextname, :nextphone, :nextaddress1, :nextaddress2, :nextaddress3, :nextaddress4, :nextaddress, :ralationship, :hospital_id, :ward_id, :doctor_id,:attachment,:status)
    end
end
