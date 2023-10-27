class Api::V1::HousesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @houses = House.all
        render json: @houses
    end
    def create
        @house = House.create(house_name: 'Test House',
        house_image: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80',
        location: 'Nairobi',
        description: 'A very nice house',
        user_id: 1)
       if @house.save
        render json: @house, status: :created
       else
        render json: @house.errors, :status => :unprocessable_entity
       end
    end
end