class Api::V1::HousesController < ApplicationController
  def index
    @houses = House.all
    if @houses
      render json: @houses
    else
      render json: { error: 'No Houses Available' }, status: :not_found
    end
  end

  def create
    @house = House.new(
      house_name: params['house_name'],
      house_image: params['house_image'],
      location: params['location'],
      description: params['description'],
      user_id: params['user_id']
    )

    if @house.save
      render json: @house, status: :created
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def show
    @house = House.find(params[:id])
    render json: @house
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'No such house' }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    @house = House.find(params[:id])
    begin
      @house.destroy!
      head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'House not found' }, status: :not_found
    rescue ActiveRecord::RecordNotDestroyed
      render json: { error: 'Failed to destroy the house' }, status: :unprocessable_entity
    end
  end
end