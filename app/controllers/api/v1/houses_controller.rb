class Api::V1::HousesController < ApplicationController
    def index
        @houses = House.all
        render json: @houses
    end
    def create
     house = House.find (params[:id])
       
     end
    end
end