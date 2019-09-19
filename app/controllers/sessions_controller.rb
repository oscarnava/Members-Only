class SessionsController < ApplicationController
  def new
    @session = nil
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user&.authenticate(params[:session][:password])
      @user.remember
      cookies.permanent.signed[:user_id] = @user.id
      cookies.permanent[:remember_token] = @user.remember_token
      flash[:success] = 'Eureka!'
      redirect_to :root
    else
      flash.now[:failure] = 'Wrong password or username!'
      render :create
    end
  end

  private

  def current_user
    return unless cookies.signed[:user_id]

    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end
end
