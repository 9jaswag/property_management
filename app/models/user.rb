# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }

  has_many :properties

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
end
