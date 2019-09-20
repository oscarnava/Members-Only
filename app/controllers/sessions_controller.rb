# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @session = nil
  end

  def create
    self.current_user = User.find_by(email: params[:session][:email])

    if current_user&.authenticate(params[:session][:password])
      current_user.remember
      cookies.permanent[:remember_token] = current_user.remember_token
      flash[:success] = 'You are logged in!'
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
end
