# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_many :properties

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
