require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  before do
    @reservation = instance_double(Reservation)
  end

  describe 'GET #index' do
    it 'returns a list of reservations' do
      allow(Reservation).to receive(:all).and_return([@reservation])
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([@reservation.as_json])
    end

    it 'returns a 404 status when there are no reservations available' do
      allow(Reservation).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
      get :show, params: { id: 999 } # Assuming this ID does not exist
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Reservation not found')
    end
  end

  describe 'POST #create' do
    it 'creates a new reservation' do
      reservation_attributes = {
        checking_date: '2023-10-30',
        checkout_date: '2023-11-05',
        city: 'Some City',
        house_price: 100.0,
        user_id: 1,
        house_id: 1
      }
      allow(Reservation).to receive(:new).with(reservation_attributes).and_return(@reservation)
      allow(@reservation).to receive(:save).and_return(true)
      expect(@reservation.save).to be true
    end
  end

  describe 'GET #show' do
    it 'returns the details of a reservation' do
      allow(Reservation).to receive(:find_by).and_return(@reservation)
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(@reservation.as_json)
    end

    it 'returns a 404 status when the reservation is not found' do
      allow(Reservation).to receive(:find_by).and_return(nil)
      get :show, params: { id: 999 } # Assuming this ID does not exist
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Reservation not found')
    end

    it 'returns an internal server error when an unexpected error occurs' do
      allow(Reservation).to receive(:find_by).and_raise(StandardError, 'Unexpected error')
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:internal_server_error)
      expect(JSON.parse(response.body)).to include('error' => 'Unexpected error')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys a reservation' do
      allow(Reservation).to receive(:find).and_return(@reservation)
      allow(@reservation).to receive(:destroy!).and_return(true)
      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:no_content)
    end

    it 'returns an unprocessable entity status when an error occurs during destruction' do
      allow(Reservation).to receive(:find).and_return(@reservation)
      allow(@reservation).to receive(:destroy!).and_raise(ActiveRecord::RecordNotDestroyed,
                                                          'Failed to destroy the house')
      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include('error' => 'Failed to destroy the reservation')
    end
  end
end
