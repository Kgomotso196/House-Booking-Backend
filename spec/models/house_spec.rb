require 'rails_helper'
RSpec.describe House, type: :model do
  before(:each) do
    @user1 = User.create(name: 'Tonny', email: 'tjay@email.com', password: 'password',
                         password_confirmation: 'password')
    @house1 = House.create(house_name: 'Milk juice',
                           house_image: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80',
                           location: 'Nairobi',
                           description: 'A very nice house',
                           user_id: @user1.id)
  end
  it 'Should have valid attributes' do
    expect(@house1).to be_valid
  end
  it 'Should have a name' do
    @house1.house_name = nil
    expect(@house1).to_not be_valid
  end
  it 'Should have an image' do
    @house1.house_image = nil
    expect(@house1).to_not be_valid
  end
  it 'Icon should be a string' do
    @house1.house_image = 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80'
    expect(@house1).to be_valid
  end
  it 'Should have a name as a string' do
    @house1.house_name = 'Milk juice'
    expect(@house1).to be_valid
  end
  it 'Should have a user' do
    @house1.user_id = nil
    expect(@house1).to_not be_valid
  end
end
