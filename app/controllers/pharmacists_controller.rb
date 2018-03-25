class PharmacistsController < ApplicationController
  before_action :set_pharmacist, only: [:show, :edit, :update, :destroy]

  # GET /pharmacists
  # GET /pharmacists.json
  def index
    authorize! :create, Pharmacist
    hospital = Hospital.find(params[:hospital_id])
    @pharmacists = hospital.pharmacists
  end

  # GET /pharmacists/1
  # GET /pharmacists/1.json
  def show
  end

  # GET /pharmacists/new
  def new
    authorize! :create, Pharmacist
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards
     @pharmacist = hospital.pharmacists.build
     
  end

  # GET /pharmacists/1/edit
  def edit
    authorize! :update, Pharmacist
  end

  # POST /pharmacists
  # POST /pharmacists.json
  def create
    authorize! :create, Pharmacist
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards
    @pharmacist = hospital.pharmacists.create(pharmacist_params)
    respond_to do |format|
      if @pharmacist.save
        format.html { redirect_to hospital_path(hospital.id), notice: 'Pharmacist was successfully created.' }
        format.json { render :show, status: :created, location: @pharmacist }
      else
        format.html { render :new }
        format.json { render json: @pharmacist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacists/1
  # PATCH/PUT /pharmacists/1.json
  def update
    respond_to do |format|
      if @pharmacist.update(pharmacist_params)
        format.html { redirect_to hospital_pharmacist_path(@pharmacist.hospital_id,@pharmacist), notice: 'Pharmacist was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharmacist }
      else
        format.html { render :edit }
        format.json { render json: @pharmacist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacists/1
  # DELETE /pharmacists/1.json
  def destroy
    @pharmacist.destroy
    respond_to do |format|
      format.html { redirect_to hospital_pharmacists_path, notice: 'Pharmacist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacist
      hospital = Hospital.find(params[:hospital_id])
      @ward = hospital.wards
      @pharmacist = hospital.pharmacists.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharmacist_params
      params.require(:pharmacist).permit(:fname, :lname, :email, :title, :address1, :address2, :address3, :address4,:address, :phone, :ward_id, :pharmacy_id, :role, :hname, :password, :password_confirmation, :hospital_id)
    end
end
