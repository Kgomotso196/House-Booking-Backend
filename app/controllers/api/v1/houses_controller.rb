class Api::V1::HousesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @houses = House.all
    render json: @houses
  end

  def create
    @house = House.new(house_params)
    if @house.save
      render json: @house, status: :created
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  private

  def house_params
    params.require(:house).permit(:house_name, :house_image, :house_price, :description, :location, :user_id)
  end
end
