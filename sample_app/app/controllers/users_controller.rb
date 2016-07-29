class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
#    debugger
  end

  def create
    @user = User.new(user_params) ## Invoke user_params method
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render action: 'new'
    end       
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :password, :password_confirmation)
    end
end 
 
