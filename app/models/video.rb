# frozen_string_literal: true

class Video < ApplicationRecord
  YT_LINK_FORMAT = %r{\A.*(youtu.be/|v/|u/\w/|embed/|watch\?v=|\&v=)([^#\&\?]*).*}i.freeze

  paginates_per 6

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :link, presence: true, format: YT_LINK_FORMAT

  def image_url
    "https://img.youtube.com/vi/#{uid}/mqdefault.jpg"
  end

  def watch_url
    "https://www.youtube.com/watch?v=#{uid}"
  end

  def embed_url
    "https://www.youtube.com/embed/#{uid}"
  end
end
