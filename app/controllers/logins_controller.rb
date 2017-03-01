class LoginsController < ApplicationController
  def index
  end
  
  def create
    @user = User.find_by_name_and_pwd(params[:name], params[:pwd])
    
    if @user
      session[:current_user_id] = params[:name]
      redirect_to articles_path
    else
      render 'index'
    end
  end
end
