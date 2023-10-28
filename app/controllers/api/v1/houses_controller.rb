class Api::V1::HousesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @houses = House.all
    if @houses
      render json: @houses
    else
      render json: { error: 'No Houses Available' }, status: :not_found
    end
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
    begin
      @house = House.find(params[:id])
      render json: @house
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'No such house' }, status: :not_found
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end
  

  def destroy
    @house = House.find(params[:id])
  end

  private

  def house_params
    params.require(:house).permit(:house_name, :house_image, :house_price, :description, :location, :user_id)
  end
end
