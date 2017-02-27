class UserController < ApplicationController
  def index
  end
  
  def login
    @Join = Join.find_by_ids_and_pwd(params[:ids],params[:pwd])
    
    if @Join
      session[:current_user_id] = params[:ids]
      puts(session[:current_user_id])
      redirect_to articles_path
    else
      render 'index'
    end
  end
end
