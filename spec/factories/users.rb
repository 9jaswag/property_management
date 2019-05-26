# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'johndoe@email.com' }
    password { 's0m3l0ngha5h' }
  end
end
