class ReceptionistsController < ApplicationController
  before_action :set_receptionist, only: [:show, :edit, :update, :destroy]

  # GET /receptionists
  # GET /receptionists.json
  def index
    authorize! :create, Receptionist
    hospital = Hospital.find(params[:hospital_id])
    @receptionists = hospital.receptionists
  end

  # GET /receptionists/1
  # GET /receptionists/1.json
  def show
  end

  # GET /receptionists/new
  def new
    authorize! :create, Receptionist
    hospital = Hospital.find(params[:hospital_id])
     @receptionist = hospital.receptionists.build
     @ward = hospital.wards
  end

  # GET /receptionists/1/edit
  def edit
    authorize! :update, Receptionist
  end

  # POST /receptionists
  # POST /receptionists.json
  def create
    authorize! :create, Receptionist
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards
    @receptionist = hospital.receptionists.create(receptionist_params)

    respond_to do |format|
      if @receptionist.save
        format.html { redirect_to hospital_path(hospital.id), notice: 'Receptionist was successfully created.' }
        format.json { render :show, status: :created, location: @receptionist }
      else
        format.html { render :new }
        format.json { render json: @receptionist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receptionists/1
  # PATCH/PUT /receptionists/1.json
  def update
    respond_to do |format|
      if @receptionist.update(receptionist_params)
        format.html { redirect_to hospital_patients_path(@receptionist.hospital_id), notice: 'Receptionist was successfully updated.' }
        format.json { render :show, status: :ok, location: @receptionist }
      else
        format.html { render :edit }
        format.json { render json: @receptionist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receptionists/1
  # DELETE /receptionists/1.json
  def destroy
    @receptionist.destroy
    respond_to do |format|
      format.html { redirect_to hospital_receptionists_path, notice: 'Receptionist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receptionist
      hospital = Hospital.find(params[:hospital_id])
      @receptionist = hospital.receptionists.find(params[:id])
      @ward = hospital.wards
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receptionist_params
      params.require(:receptionist).permit(:fname, :lname, :email, :title, :address1, :address2, :address3, :address4,:address, :phone, :ward_id, :pharmacyno, :role, :hname, :password, :password_confirmation, :hospital_id)
    end
end
