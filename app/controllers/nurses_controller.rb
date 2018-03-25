class NursesController < ApplicationController
  before_action :set_nurse, only: [:show, :edit, :update, :destroy]

  # GET /nurses
  # GET /nurses.json
  def index
    authorize! :create, Nurse
    hospital = Hospital.find(params[:hospital_id])
    @nurses = hospital.nurses
  end

  # GET /nurses/1
  # GET /nurses/1.json
  def show
  end

  # GET /nurses/new
  def new
    authorize! :create, Nurse
    hospital = Hospital.find(params[:hospital_id])
     @nurse = hospital.nurses.build
     @ward = hospital.wards
  end

  # GET /nurses/1/edit
  def edit
    authorize! :update, Nurse
  end

  # POST /nurses
  # POST /nurses.json
  def create
    authorize! :update, Nurse
    hospital = Hospital.find(params[:hospital_id])
     @ward = hospital.wards
    @nurse = hospital.nurses.create(nurse_params)

    respond_to do |format|
      if @nurse.save
        format.html { redirect_to hospital_nurses_path, notice: 'Nurse was successfully created.' }
        format.json { render :show, status: :created, location: @nurse }
      else
        format.html { render :new }
        format.json { render json: @nurse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nurses/1
  # PATCH/PUT /nurses/1.json
  def update
    respond_to do |format|
      if @nurse.update(nurse_params)
        format.html { redirect_to hospital_ward_path(@nurse.hospital_id,@nurse.ward_id), notice: 'Nurse was successfully updated.' }
        format.json { render :show, status: :ok, location: @nurse }
      else
        format.html { render :edit }
        format.json { render json: @nurse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nurses/1
  # DELETE /nurses/1.json
  def destroy
    @nurse.destroy
    respond_to do |format|
      format.html { redirect_to hospital_nurses_path, notice: 'Nurse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nurse
      hospital = Hospital.find(params[:hospital_id])
      @nurse = hospital.nurses.find(params[:id])
      @ward = hospital.wards
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nurse_params
      params.require(:nurse).permit(:fname, :lname, :email, :title, :address1, :address2, :address3, :address4,:address, :phone, :ward_id, :roomno, :role, :specialisation, :hname, :password, :password_confirmation, :hospital_id)
    end
end
