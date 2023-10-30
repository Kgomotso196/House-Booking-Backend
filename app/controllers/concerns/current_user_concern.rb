module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  private

  def set_current_user
    return unless session[:user_id]

    @current_user = User.find(session[:user_id])
  end
end
