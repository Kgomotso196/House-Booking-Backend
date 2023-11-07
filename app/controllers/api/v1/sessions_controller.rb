class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User
      .find_by(email: params['user']['email'])
      .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
        session: session[:user_id],
        test: 'test'
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: { logged_in: false, logged_out: @current_user}
    end
  end

  def check_user_id
    if session[:user_id]
      render json: {storage: session[:user_id]}
    else
      render json: {storage: session[:user_id]}
    end
   end

  def logout
    reset session
    render json: { status: 200, logged_out: true }
  end
end
