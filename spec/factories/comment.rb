# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    video
    body { 'this is a comment' }
  end
end
