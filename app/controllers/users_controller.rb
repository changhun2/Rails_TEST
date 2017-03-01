class UsersController < ApplicationController
  def index
  end
  
  def create
    @user = User.new(user_params)
   
    if @user.save
      redirect_to logins_path
    else
      render 'index'
    end
  end
  
  private
    def user_params
      params.permit(:name, :pwd)
    end
end
