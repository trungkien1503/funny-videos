# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :video
  belongs_to :user

  validates :body, presence: true

  paginates_per 4
end
