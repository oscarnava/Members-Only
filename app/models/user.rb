class User < ApplicationRecord
  before_create :create_token
  has_secure_password

  private

  def create_token
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end
end
