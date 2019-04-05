class UsersController < ApplicationController

  def index 
    @users = User.all 
    render :index 
  end 

  def show
    @user = User.find(params[:id])

    if @user 
      render :show 
    else  
      render json: "no user found", status: 404
    end 
  end 

  def new
    @user = User.new 
    render :new
  end 

  def create
    @user = User.new(user_params)
    
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new 
    end 
  end
  
  private 

  def user_params 
    params.require(:user).permit(:username, :password)
  end 
end
