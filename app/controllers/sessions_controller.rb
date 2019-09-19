class SessionsController < ApplicationController
  def new
    @session = nil
  end

  def create

    @user = User.find_by(email: params[:session][:email])

    if @user&.authenticate(params[:session][:password])
      new_token = User.new_token
      cookies.permanent[:remember_token] = new_token
      session[:remember_token] = @user.remember_token
      flash[:notice] = 'Eureka!'
      redirect_to :root
    else
      flash.now[:notice] = 'Wrong password or username!'
      render :create
    end
  end
end
