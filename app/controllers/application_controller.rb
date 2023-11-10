class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token

  protect_from_forgery with: :null_session

  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    # { Authorization: 'Bearer <token' }
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split[1]
    begin
      JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
    rescue StandardError
      nil
    end
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  def authorized
    if logged_in?
      true
    else
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end
end
