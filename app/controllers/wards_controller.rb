class WardsController < ApplicationController
  before_action :set_ward, only: [:show, :edit, :update, :destroy]

  # GET /wards
  # GET /wards.json
  def index
    hospital = Hospital.find(params[:hospital_id])
    @wards = hospital.wards
  end

  # GET /wards/1
  # GET /wards/1.json
  def show
    authorize! :read, Ward
    @patients = @ward.patients.where("patients.consutation = ?", Date.today).search(params[:search])
  end

  # GET /wards/new
  def new
    authorize! :create, Ward
    hospital = Hospital.find(params[:hospital_id])
     @ward = hospital.wards.build
  end

  # GET /wards/1/edit
  def edit
    authorize! :create, Ward
  end

  # POST /wards
  # POST /wards.json
  def create
    authorize! :create, Ward
    hospital = Hospital.find(params[:hospital_id])
    @ward = hospital.wards.create(ward_params)

    respond_to do |format|
      if @ward.save
        format.html { redirect_to hospital_path(hospital.id), notice: 'Ward was successfully created.' }
        format.json { render :show, status: :created, location: @ward }
      else
        format.html { render :new }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wards/1
  # PATCH/PUT /wards/1.json
  def update
    respond_to do |format|
      if @ward.update(ward_params)
        format.html { redirect_to hospital_path(hospital.id), notice: 'Ward was successfully updated.' }
        format.json { render :show, status: :ok, location: @ward }
      else
        format.html { render :edit }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wards/1
  # DELETE /wards/1.json
  def destroy
    @ward.destroy
    respond_to do |format|
      format.html { redirect_to hospital_wards_path, notice: 'Ward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ward
      hospital = Hospital.find(params[:hospital_id])
      @ward = hospital.wards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ward_params
      params.require(:ward).permit(:wname, :wardno, :hname, :hospital_id)
    end
end
