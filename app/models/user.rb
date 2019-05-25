# frozen_string_literal: true

# User model
class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :properties

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
