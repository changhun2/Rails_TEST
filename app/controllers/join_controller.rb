class JoinController < ApplicationController
  def index
  end
  
  def create
    @join = Join.new(join_params)
   
    if @join.save
      redirect_to user_index_path
    else
      render 'index'
    end
  end
  
  private
    def join_params
      params.permit(:ids, :pwd)
    end
end
