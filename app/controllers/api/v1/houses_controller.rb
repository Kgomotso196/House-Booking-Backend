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

  def show
    @house = House.find(params[:id])
    render json: @house
  end

  def destroy
    @house = House.find(params[:id])
  end

  private

  def house_params
    params.require(:house).permit(:house_name, :house_image, :house_price, :description, :location, :user_id)
  end
end
