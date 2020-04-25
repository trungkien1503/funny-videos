# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "email-#{Process.pid}-#{i}@gmail.com" }
    password { 'password' }
    password_confirmation { password }
    username { Faker::Name.first_name }
  end
end
