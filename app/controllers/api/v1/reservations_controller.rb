# frozen_string_literal: true

require_relative '../../concerns/render_helper'

class Api::V1::ReservationsController < ApiController
  include RenderHelper

  # GET /reservations
  def index
    @reservations = current_user.reservations
    if @reservations
      render_success({ message: 'Loaded all reservations', data: { reservations: @reservations } })
    else
      render_error('Ooops! Something went wrong')
    end
  end

  # POST /reservations
  def create
    @new_reservation = current_user.reservations.new(city: params[:city], date: params[:date],
                                                     doctor_id: params[:doctor_id])
    create_helper(@new_reservation, 'Reservation created', 'create')
  end

  # DELETE /reservations/1
  def destroy
    @reservation = Reservation.find(params[:id])
    create_helper(@new_reservation, 'Reservation deleted', 'delete')
  end
end
