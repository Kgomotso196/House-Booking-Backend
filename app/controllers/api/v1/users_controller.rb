class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        user = User.create(
          name: params['name'],
          email: params['email'],
          password: params['password'],
          password_confirmation: params['password_confirmation']
        )
      
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
          render json: { error: 'Failed to create user', errors: user.errors.full_messages }, status: :unprocessable_entity
        end

        @user =  user
    end
    
    def profile
        render json: @user
    end
end
