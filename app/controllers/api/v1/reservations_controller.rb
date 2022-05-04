# frozen_string_literal: true

class Api::V1::ReservationsController < ApiController
  # GET /reservations
  def index
    @reservations = current_user.reservations
    if @reservations
      render json: { success: true, message: 'Loaded all reservations', data: { reservations: @reservations } },
             status: :ok
    else
      render json: { success: false, errors: 'Opps! Something went wrong' }, status: :unprocessable_entity
    end
  end

  # POST /reservations
  def create
    @user = User.find(params[:user_id])
    @new_reservation = @user.reservations.create(city: params[:city], date: params[:date],
                                                 doctor_id: params[:doctor_id])
    if @new_reservation.save
      render json: { success: true, message: 'Reservation created', data: { reservation: @new_reservation } },
             status: :created
    else
      render json: { success: false, errors: @new_reservation.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation = Reservation.find(params[:reservation_id])
    if @reservation.destroy
      render json: { success: true, message: 'Reservation deleted', data: { reservation: @reservation } },
             status: :created
    else
      render json: { success: false, errors: 'Wrong reservation id' }, status: :unprocessable_entity
    end
  end
end
