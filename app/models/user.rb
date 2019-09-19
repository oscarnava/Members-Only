class User < ApplicationRecord
  before_create :create_token
  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64.to_s
  end

  private

  def create_token
    self.remember_token = Digest::SHA1.hexdigest(new_token)
  end
end
