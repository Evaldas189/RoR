# frozen_string_literal: true

# ApplicationController class
class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  add_flash_types :danger, :info, :warning, :success

  def current_user_admin
    return unless session[:user_id]

    admin = User.find(session[:user_id])
    @admin_current = 'admin' if admin.rights == 'admin'
  end

  def current_user_name
    return unless session[:user_id]

    user = User.find(session[:user_id])

    @name = user.vardas
  end
  helper_method :current_user
  helper_method :current_user_admin
  helper_method :current_user_name

  def authorize
    redirect_to '/prisijungimas' unless current_user
  end
  def noauthorize
    redirect_to '/' unless !current_user
  end
end
