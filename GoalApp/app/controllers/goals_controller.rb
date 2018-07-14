class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new
    @user = User.find_by(id: params[:user_id])
    
  end
  
  def create
    @goal = Goal.new(user_id: params[:user_id], goal_params)
  end
end
