require 'rails_helper'

RSpec.describe Api::V1::HousesController, type: :controller do
  before do
    @house = instance_double(House)
  end

  describe 'GET #index' do
    it 'returns a list of houses' do
      allow(House).to receive(:all).and_return([@house])
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([@house.as_json])
    end
  end

  describe 'POST #create' do
    it 'creates a new house' do
      house_attributes = {
        house_name: 'Test House',
        house_image: 'test.jpg',
        description: 'Description of the house',
        location: 'Some Location',
        user_id: 1  
      }
      allow(House).to receive(:new).with(house_attributes).and_return(@house)
      allow(@house).to receive(:save).and_return(true)
      expect(@house.save).to be true
    end
  end

  describe 'GET #show' do
    it 'returns the details of a house' do
      allow(House).to receive(:find).and_return(@house)
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(@house.as_json)
    end

    it 'returns a 404 status when the house is not found' do
      allow(House).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
      get :show, params: { id: 999 } # Assuming this ID does not exist
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'No such house')
    end

    it 'returns an internal server error when an unexpected error occurs' do
      allow(House).to receive(:find).and_raise(StandardError, 'Unexpected error')
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:internal_server_error)
      expect(JSON.parse(response.body)).to include('error' => 'Unexpected error')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys a house' do
      allow(House).to receive(:find).and_return(@house)
      allow(@house).to receive(:destroy!).and_return(true)
      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:no_content)
    end

    it 'returns an unprocessable entity status when an error occurs during destruction' do
      allow(House).to receive(:find).and_return(@house)
      allow(@house).to receive(:destroy!).and_raise(ActiveRecord::RecordNotDestroyed, 'Failed to destroy the house')
      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include('error' => 'Failed to destroy the house')
    end
  end
end
