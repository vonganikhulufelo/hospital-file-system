class AdministratorsController < ApplicationController
  before_action :set_administrator, only: [:show, :edit, :update, :destroy]

  # GET /administrators
  # GET /administrators.json
  def index
    authorize! :creat, Administrator
    hospital = Hospital.findn(params[:hospital_id])
    @administrators = hospital.administrators
  end

  # GET /administrators/1
  # GET /administrators/1.json
  def show
    authorize! :create, Administrator
  end

  # GET /administrators/new
  def new
    authorize! :creat, Administrator
    hospital = Hospital.find(params[:hospital_id])
    @administrator = hospital.administrators.build
  end

  # GET /administrators/1/edit
  def edit
    authorize! :update, Administrator
  end

  # POST /administrators
  # POST /administrators.json
  def create
    authorize! :update, Administrator
    hospital = Hospital.find(params[:hospital_id])
    @administrator = hospital.administrators.create(administrator_params)

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to hospital_administrator_path(@administrator.hospital,@administrator), notice: 'Administrator was successfully created.' }
        format.json { render :show, status: :created, location: @administrator }
      else
        format.html { render :new }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrators/1
  # PATCH/PUT /administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to hospital_path(@administrator.hospital_id), notice: 'Administrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrator }
      else
        format.html { render :edit }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  def destroy
    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to hospital_administrators_path(@administrator), notice: 'Administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      hospital = Hospital.find(params[:hospital_id])
      @administrator = hospital.administrators.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:fname, :lname, :email, :title, :address1, :address2, :address3, :address4,:address, :phone, :officeno, :hname, :password, :password_confirmation, :hospital_id)
    end
end
