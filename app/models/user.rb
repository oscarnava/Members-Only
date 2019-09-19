class User < ApplicationRecord
  attr_accessor :remember_token

  before_create :create_token
  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64.to_s
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_token, Digest::SHA1.hexdigest(remember_token))
  end

  private

  def create_token
    self.remember_token = Digest::SHA1.hexdigest(new_token)
  end
end
