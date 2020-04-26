# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Grid view page', type: :feature do
  let(:user) { create(:user) }
  let!(:video) { create(:video, user: user) }

  scenario 'as a guest or an user, I can see all videos as grid view' do
    visit grid_view_videos_path
    expect(page).to have_content(video.title)
  end
end
