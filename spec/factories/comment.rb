# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    video
    sequence(:body) { |i| "this is a comment #{Process.pid}-#{i}" }
  end
end
