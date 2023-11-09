require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user1 = User.create(name: 'Tonny', email: 'tjay@email.com', password: 'password',
                         password_confirmation: 'password')
    @house1 = House.create(house_name: 'Milk juice',
                           house_image: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80',
                           location: 'Nairobi',
                           description: 'A very nice house',
                           user_id: @user1.id)

    @reservation1 = Reservation.create(
      checking_date: 'checking_date',
      checkout_date: 'checkout_date',
      city: 'Nairobi',
      house_price: 'house_price',
      user_id: @user1.id,
      house_id: @house1.id
    )
  end

  # presence

  it 'Should have valid attributes' do
    expect(@reservation1).to be_valid
  end

  it 'Should have a checking_date' do
    @reservation1.checking_date = nil
    expect(@reservation1).to_not be_valid
  end

  it 'Should have a checkout_date' do
    @reservation1.checkout_date = nil
    expect(@reservation1).to_not be_valid
  end

  it 'Should have a city' do
    @reservation1.city = nil
    expect(@reservation1).to_not be_valid
  end

  it 'Should have a house_price' do
    @reservation1.house_price = nil
    expect(@reservation1).to_not be_valid
  end

  it 'Should have a user_id' do
    @reservation1.user_id = nil
    expect(@reservation1).to_not be_valid
  end

  it 'Should have a user_id' do
    @reservation1.house_id = nil
    expect(@reservation1).to_not be_valid
  end

  # # validation
  it 'Should have a house_price as a string' do
    @reservation1.house_price = 'house_price'
    expect(@reservation1).to be_valid
  end
  it 'Should have a checkout_date as a string' do
    @reservation1.checkout_date = 'checkout_date'
    expect(@reservation1).to be_valid
  end
  it 'Should have a city as a string' do
    @reservation1.city = 'city'
    expect(@reservation1).to be_valid
  end
  it 'Should have a house_price as a string' do
    @reservation1.house_price = 'house_price'
    expect(@reservation1).to be_valid
  end
end
