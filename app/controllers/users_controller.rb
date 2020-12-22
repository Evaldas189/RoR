# frozen_string_literal: true

# UsersController class
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize
  skip_before_action :authorize, only: [:new_user, :new]
  before_action :noauthorize, only: [:new]

  def new; end

  def new_admin; end

  def new_user # rubocop:disable Metrics/MethodLength
    user = User.new(user_params)
    if User.where(pastas: user.pastas).any?
      redirect_to new_path, danger: 'Paskyra su tokiu el.paštu jau egzistuoja'

    elsif user.valid?
      if user.save
        redirect_to '/prisijungimas'
      else
        redirect_to new_path, danger: 'registracija nesėkminga!'
      end
    else
      redirect_to new_path, danger: 'registracija nesėkminga!'
    end
  end

  def new_user_admin # rubocop:disable Metrics/MethodLength
    user = User.new(user_params)
    if User.where(pastas: user.pastas).any?
      redirect_to new_admin_path, danger: 'Paskyra su tokiu el.paštu jau egzistuoja'

    elsif user.valid?
      if user.save
        redirect_to new_admin_path, success: 'registracija sėkminga!'
      else
        redirect_to new_admin_path, danger: 'registracija nesėkminga!'
      end
    else
      redirect_to new_admin_path, danger: 'registracija nesėkminga!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:vardas, :pastas, :password_digest, :rights)
  end
end
