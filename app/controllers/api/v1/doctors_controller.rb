# frozen_string_literal: true

require_relative '../../concerns/render_helper'

class Api::V1::DoctorsController < ApiController
  include RenderHelper

  # GET /doctors
  def index
    @doctors = Doctor.all
    if @doctors
      render_success({ message: 'Loaded all doctors', data: { doctors: @doctors } })
    else
      render_error('Ooops! Something went wrong')
    end
  end

  # POST /doctors
  def create
    @new_doctor = Doctor.new(name: params[:name], details: params[:details], photo: params[:photo],
                             city: params[:city], specialization: params[:specialization], cost: params[:cost])
    create_helper(@new_doctor, 'Doctor created', 'create')
  end

  # DELETE /doctors/1
  def destroy
    @doctor = Doctor.find(params[:id])
    create_helper(@doctor, 'Doctor deleted', 'delete')
  end
end
