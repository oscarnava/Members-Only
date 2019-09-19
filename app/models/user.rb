class User < ApplicationRecord
  before_action :create_token
  has_secure_password

  private

  def create_token

  end
end
