# frozen_string_literal: true

class Api::V1::DoctorsController < ApiController
  # before_action :authenticate_user!
  before_action :set_doctor, only: %i[show update destroy]

  # GET /doctors
  def index
      @doctors = Doctor.all
      if @doctors
        render json: { success: true, message: 'Loaded all doctors', data: { doctors: @doctors } }, status: :ok
      else
        render json: { success: false, errors: 'Opps! Something went wrong' }, status: :unprocessable_entity
      end
  end

  # GET /doctors/1
  def show
    render json: @doctor
  end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created, location: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    @doctor = User.find(params[:doctor_id])
    if @doctor
      @doctor.destroy
      render json: { success: true, message: 'Doctor deleted', data: { doctor: @doctor } }, status: :created
    else
      render json: { success: false, errors: 'Wrong doctor id' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :address, :phone, :email)
  end
end
