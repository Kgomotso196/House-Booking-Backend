require 'rails_helper'
RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Tonny', email: 'tjay@email.com', password: 'password',
                        password_confirmation: 'password')
  end
  it 'valid user with valid attributes' do
    expect(@user).to be_valid
  end
  it 'invalid user without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end
