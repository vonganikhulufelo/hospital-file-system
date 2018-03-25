class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: [:show, :edit, :update, :destroy]

  # GET /pharmacies
  # GET /pharmacies.json
  def index
    authorize! :create, Pharmacy
    hospital = Hospital.find(params[:hospital_id])
    @pharmacies = hospital.pharmacies
  end

  # GET /pharmacies/1
  # GET /pharmacies/1.json
  def show
    authorize! :create, Pharmacy
  end

  # GET /pharmacies/new
  def new
    authorize! :create, Pharmacy
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards
     @pharmacy = hospital.pharmacies.build
  end

  # GET /pharmacies/1/edit
  def edit
    authorize! :create, Pharmacy
  end

  # POST /pharmacies
  # POST /pharmacies.json
  def create
    authorize! :create, Pharmacy
    hospital = Hospital.find(params[:hospital_id])
    @pharmacy = hospital.pharmacies.create(pharmacy_params)

    respond_to do |format|
      if @pharmacy.save
        format.html { redirect_to hospital_path(hospital.id), notice: 'Pharmacy was successfully created.' }
        format.json { render :show, status: :created, location: @pharmacy }
      else
        format.html { render :new }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacies/1
  # PATCH/PUT /pharmacies/1.json
  def update
    respond_to do |format|
      if @pharmacy.update(pharmacy_params)
        format.html { redirect_to hospital_path(hospital.id), notice: 'Pharmacy was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharmacy }
      else
        format.html { render :edit }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacies/1
  # DELETE /pharmacies/1.json
  def destroy
    @pharmacy.destroy
    respond_to do |format|
      format.html { redirect_to hospital_pharmacies_path, notice: 'Pharmacy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacy
      hospital = Hospital.find(params[:hospital_id])
      @ward = hospital.wards
      @pharmacy = hospital.pharmacies.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharmacy_params
      params.require(:pharmacy).permit(:pahrmacyno, :pharmacyname, :ward_id, :hname, :hospital_id)
    end
end
