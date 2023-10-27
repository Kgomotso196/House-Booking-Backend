class Api::V1::HousesController < ApplicationController
    def index
        render json: @houses
    end
end