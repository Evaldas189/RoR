# frozen_string_literal: true

# FreeTryUserController class
class FreeTryUserController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :free_try_userslist
  before_action :authorize

  def free_try_userslist
    # @users = User.find(:all)
    @users = if params[:search].blank?
               FreeTryUser.all
             else
               FreeTryUser.where(vardas: params[:search])
             end
  end

  def create # rubocop:disable Metrics/MethodLength
    @user = User.find(session[:user_id])
    if @user.freeTryUser.nil?
      try = FreeTryUser.new(params.require(:user).permit(:vardas, :pavarde, :pastas, :telefonas, :user_id))
      if try.valid?
        @free_try = FreeTryUser.create(user_params)
        @user.freeTryUser = @free_try
        redirect_to try_path, success: 'Registracija sėkminga!'
      else
        redirect_to try_path, danger: 'Registracija nesėkminga!'
      end
    else
      redirect_to try_path, danger: 'Jūs jau išnaudojote savo nemokamą pabandymą!'
    end
  end

  def delete
    FreeTryUser.where(id: params[:id]).destroy if params[:delete_btn]
    redirect_to '/list'
  end

  def edit
    @user = FreeTryUser.find(params[:id])
    p @user
  end

  def update
    @user = FreeTryUser.find(params.require(:user).permit(:id))
    if @user.valid?
      @user.update(user_params)
      redirect_to '/list'
    else
      redirect_to '/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:vardas, :pavarde, :pastas, :telefonas)
  end
end
