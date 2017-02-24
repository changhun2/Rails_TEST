class UserController < ApplicationController
  def index
   @join = Join.new(join_params)
   
   if @join.save
     redirect_to @join
   else
     render 'index'
   end
  end
  
  private
    def join_params
      params.permit(:id, :pw)
    end
end
