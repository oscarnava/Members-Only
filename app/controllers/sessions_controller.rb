class SessionsController < ApplicationController
  def new
    @session = nil
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user.authenticate(params[:session][:password])
      session[:remember_token] = @user.remember_token
      flash[:notice] = 'Eureka!'
      redirect_to :root
    else
      render :create
    end
  end
end
