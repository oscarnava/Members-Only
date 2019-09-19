class SessionsController < ApplicationController
  before_action :current_user

  def new
    @session = nil
  end

  def create
    self.current_user = User.find_by(email: params[:session][:email])

    if current_user&.authenticate(params[:session][:password])
      current_user.remember
      cookies.permanent[:remember_token] = current_user.remember_token
      flash[:success] = 'Eureka!'
      redirect_to :root
    else
      flash.now[:failure] = 'Wrong password or username!'
      render :create
    end
  end

  def delete
    self.current_user = nil
    redirect_to :root
  end

  private

  def current_user
    return nil unless cookies.signed[:user_id]

    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def current_user=(user)
    if user
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    else
      cookies.delete :user_id
      cookies.delete :remember_token
    end
    @current_user = user || nil
  end

end
