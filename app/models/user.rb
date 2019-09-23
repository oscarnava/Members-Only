# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token

  before_create :create_token
  has_secure_password
  has_many :posts

  validates :name, presence: true, length: { in: 4..30 }
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, length: { in: 4..30 }

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

end
