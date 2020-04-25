# frozen_string_literal: true

class Video < ApplicationRecord
  YT_LINK_FORMAT = %r{\A.*(youtu.be/|v/|u/\w/|embed/|watch\?v=|\&v=)([^#\&\?]*).*}i.freeze

  belongs_to :user

  validates :link, presence: true, format: YT_LINK_FORMAT

  def youtube_url
    "https://img.youtube.com/vi/#{uid}/mqdefault.jpg"
  end

  def watch_url
    "https://www.youtube.com/watch?v=#{uid}"
  end

  def embed_url
    "https://www.youtube.com/embed/#{uid}"
  end
end
