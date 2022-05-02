# frozen_string_literal: true

class Api::V1::DoctorsController < ApiController
  # before_action :authenticate_user!

  # GET /doctors
  def index
      @doctors = Doctor.all
      if @doctors
        render json: { success: true, message: 'Loaded all doctors', data: { doctors: @doctors } }, status: :ok
      else
        render json: { success: false, errors: 'Opps! Something went wrong' }, status: :unprocessable_entity
      end
  end

  # POST /doctors
  def create
    @new_doctor = Doctor.new(name: params[:name], details: params[:details], photo: params[:photo], city: params[:city], specialization: params[:specialization], cost: params[:cost])
     if @new_doctor.save
       render json: { success: true, message: 'Doctor created', data: { doctor: @new_doctor } }, status: :created
     else
       render json: { success: false, errors: new_doctor.errors }, status: :unprocessable_entity
     end
  end

  # DELETE /doctors/1
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    # if @doctor
     if @doctor.destroy
      render json: { success: true, message: 'Doctor deleted', data: { doctor: @doctor } }, status: :created
    else
      render json: { success: false, errors: 'Wrong doctor id' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_doctor
  #   @doctor = Doctor.find(params[:id])
  # end
end
