class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  # GET /hospitals
  # GET /hospitals.json
  def index
    authorize! :creat, Ward
    @hospitals = Hospital.all
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
    authorize! :update, Hospital
  end

  # GET /hospitals/new
  def new
    authorize! :creat, Ward
    @hospital = Hospital.new
  end

  # GET /hospitals/1/edit
  def edit
    authorize! :update, Hospital
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
authorize! :creat, Ward
    @hospital = Hospital.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: 'Hospital was successfully created.' }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitals/1
  # PATCH/PUT /hospitals/1.json
  def update
    authorize! :update, Hospital
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
      @pharmacies =  @hospital.pharmacies
      @doctors =  @hospital.doctors
      @nurses =  @hospital.nurses
      @pharmacists =  @hospital.pharmacists
      @receptionists =  @hospital.receptionists
      @wards =  @hospital.wards
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_params
      params.require(:hospital).permit(:hname, :htellphone, :haddress1, :haddress2, :haddress3, :haddresscode, :haddress)
    end
end
