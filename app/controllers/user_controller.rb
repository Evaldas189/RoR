class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action:usersList

    def usersList
      #@users = User.find(:all)
      if params[:search].blank?
        @users = User.all
      else
        @users = User.where(vardas: params[:search])
      end
      
      
    end

    

    def create

      user = User.new(user_params)
      if user.valid?
        if user.save()
            redirect_to '/list'
        else
            redirect_to '/try'
        end
      else
        redirect_to '/try'
      end
    end

    def deleteupdate
      if params[:delete_btn]
        User.where(id: params[:id]).destroy
      end
      redirect_to '/list'
    end

    def edit
      @user = User.find(params[:id])
      p @user
    end

    def update
      @user = User.find(params.require(:user).permit(:id))
      if @user.valid?
      @user.update(user_params)
      redirect_to '/list'
      else
        redirect_to '/edit'
      end
    end



  

    private 
    def user_params
        params.require(:user).permit(:vardas,:pavarde,:pastas,:telefonas)
    end


end
