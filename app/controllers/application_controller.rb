# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user

  def is_logged_in?
    current_user
  end

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
