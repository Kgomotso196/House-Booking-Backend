class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @reservations = Reservation.all
    if @reservations
      render json: @reservations
    else
      render json: { error: 'No reservations Available' }, status: :not_found
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])

    if @reservation
      render json: @reservation
    else
      render json: { error: 'Reservation not found' }, status: :not_found
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checking_date, :checkout_date, :city, :house_price, :user_id, :house_id)
  end
end
