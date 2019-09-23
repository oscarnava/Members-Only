class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'You successfully created a new user.'
      self.current_user = @user
      redirect_to :root
    else
      flash.now[:failure] = 'Failed to create new user.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
