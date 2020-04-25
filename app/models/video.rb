# frozen_string_literal: true

class Video < ApplicationRecord
  YT_LINK_FORMAT = %r{\A.*(youtu.be/|v/|u/\w/|embed/|watch\?v=|\&v=)([^#\&\?]*).*}i.freeze

  validates :link, presence: true, format: YT_LINK_FORMAT
end
