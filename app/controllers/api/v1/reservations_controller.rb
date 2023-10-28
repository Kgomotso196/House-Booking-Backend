class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checking_date, :checkout_date, :city, :house_price, :user_id, :house_id)
  end
end
