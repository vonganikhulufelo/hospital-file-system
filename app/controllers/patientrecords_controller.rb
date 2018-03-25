class PatientrecordsController < ApplicationController
  before_action :set_patientrecord, only: [:show, :edit, :update, :destroy]

  # GET /patientrecords
  # GET /patientrecords.json
  def index
    patient = Patient.find(params[:patient_id])
    @patientrecords = patient.patientrecords
  end

  # GET /patientrecords/1
  # GET /patientrecords/1.json
  def show
  end

  # GET /patientrecords/new
  def new
    authorize! :update, Nurse
    patient = Patient.find(params[:patient_id])
    @patientrecord = patient.patientrecords.build
  end

  # GET /patientrecords/1/edit
  def edit
  end

  # POST /patientrecords
  # POST /patientrecords.json
  def create
    authorize! :update, Nurse
    patient = Patient.find(params[:patient_id])
      @patientrecord = patient.patientrecords.create(patientrecord_params)
    respond_to do |format|
      if @patientrecord.save
        format.html { redirect_to patient_patientrecords_path, notice: 'Patientrecord was successfully created.' }
        format.json { render :show, status: :created, location: @patientrecord }
      else
        format.html { render :new }
        format.json { render json: @patientrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patientrecords/1
  # PATCH/PUT /patientrecords/1.json
  def update
    respond_to do |format|
      if @patientrecord.update(patientrecord_params)
        format.html { redirect_to patient_patientrecords_path, notice: 'Patientrecord was successfully updated.' }
        format.json { render :show, status: :ok, location: @patientrecord }
      else
        format.html { render :edit }
        format.json { render json: @patientrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patientrecords/1
  # DELETE /patientrecords/1.json
  def destroy
    @patientrecord.destroy
    respond_to do |format|
      format.html { redirect_to patientrecords_url, notice: 'Patientrecord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patientrecord
      patient = Patient.find(params[:patient_id])
      @patientrecord = patient.patientrecords.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patientrecord_params
      params.require(:patientrecord).permit(:age, :bp, :heartrate, :weight, :illness, :prescription, :drugcollected, :patient_id,:consultation)
    end
end
