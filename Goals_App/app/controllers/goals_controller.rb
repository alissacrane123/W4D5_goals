class GoalsController < ApplicationController
  def new 
    @goal = Goal.new 
    render :new 
  end
  
  def create 
    @goal = Goal.new(goal_params)
  end 

  private 

  def goal_params 
    params.require(:goal).permit(:body, :user_id, :private?)
  end 
end