# frozen_string_literal: true

# SessionsController class
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :noauthorize, only: [:login]

  def login; end

  def create # rubocop:disable Metrics/MethodLength
    if User.where(pastas: params[:pastas]).any?
      user = User.find_by(pastas: params[:pastas])
      if user.valid?
        if user&.authenticate(user.pastas, params[:password_digest])
          session[:user_id] = user.id
          redirect_to '/'
        else
          redirect_to login_path, danger: 'Prisijungimas nesėkmingas!'
        end
      else
        redirect_to login_path, danger: 'Prisijungimas nesėkmingas!'
      end
    else
      redirect_to login_path, danger: 'Paskyra su tokiu el.paštu neegzistuoja!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/prisijungimas'
  end
end
