class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def create
    @reservation = Reservation.create(
      checking_date: 'Today',
      checkout_date: 'Wednesday',
      city: 'Mombasa',
      house_price: 'house_price',
      user_id: 1,
      house_id: 2
    )
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end
end
