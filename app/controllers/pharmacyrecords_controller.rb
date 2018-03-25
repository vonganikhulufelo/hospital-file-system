class PharmacyrecordsController < ApplicationController
  before_action :set_pharmacyrecord, only: [:show, :edit, :update, :destroy]

  # GET /pharmacyrecords
  # GET /pharmacyrecords.json
  def index
    hospital = Hospital.find(params[:hospital_id])
    @patientrecords = hospital.patients.joins(:patientrecords).select('patients.fname as fname, patients.lname as lname, patientrecords.age as age, patients.consutation as consultation, patientrecords.drugcollected as collected, patientrecords.prescription as prescription, patientrecords.id as prid, patientrecords.patient_id as pid, patientrecords.created_at as created').group('patients.id, patientrecords.id').search(params[:search])
   @pharmacyrecord = hospital.pharmacyrecords.build
  end

  # GET /pharmacyrecords/1
  # GET /pharmacyrecords/1.json
  def show
  end

  # GET /pharmacyrecords/new
 

  # GET /pharmacyrecords/1/edit
  def edit
  end

  # POST /pharmacyrecords
  # POST /pharmacyrecords.json
  def create
    hospital = Hospital.find(params[:hospital_id])
      @pharmacyrecord = hospital.pharmacyrecords.create(pharmacyrecord_params)

    respond_to do |format|
      if @pharmacyrecord.save
        format.html { redirect_to hospital_pharmacyrecords_path, notice: 'Pharmacyrecord was successfully created.' }
        format.json { render :show, status: :created, location: @pharmacyrecord }
      else
        format.html { render :new }
        format.json { render json: @pharmacyrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacyrecords/1
  # PATCH/PUT /pharmacyrecords/1.json
  def update
    respond_to do |format|
      if @pharmacyrecord.update(pharmacyrecord_params)
        format.html { redirect_to @pharmacyrecord, notice: 'Pharmacyrecord was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharmacyrecord }
      else
        format.html { render :edit }
        format.json { render json: @pharmacyrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacyrecords/1
  # DELETE /pharmacyrecords/1.json
  def destroy
    @pharmacyrecord.destroy
    respond_to do |format|
      format.html { redirect_to pharmacyrecords_url, notice: 'Pharmacyrecord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacyrecord
      hospital = Hospital.find(params[:hospital_id])
      @pharmacyrecord = hospital.pharmacyrecords.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharmacyrecord_params
      params.require(:pharmacyrecord).permit(:collected, :hospital_id, :lname, :fname, :pid, :prid)
    end
end
