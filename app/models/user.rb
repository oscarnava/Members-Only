class User < ApplicationRecord
  attr_accessor :remember_token

  before_create :create_token
  has_secure_password
  has_many :posts

  def self.new_token
    SecureRandom.urlsafe_base64.to_s
  end

  def remember
    @remember_token = User.new_token
    update_attribute(:remember_token, Digest::SHA1.hexdigest(@remember_token))
  end

  private

  def create_token
    @remember_token = Digest::SHA1.hexdigest(User.new_token)
  end

  # def inspect
  #   "User: #{self.name}"
  # end

  # def to_s
  #   inspect
  # end

end
