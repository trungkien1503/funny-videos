# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Your videos page', type: :feature do
  let(:user) { create(:user) }
  let!(:video) { create(:video, user: user) }

  scenario 'as a guest, I need to move to login page to access my videos page' do
    visit yours_videos_path
    expect(page).to have_content('Login')
  end

  scenario 'as an user, I can access and see my videos page' do
    sign_in_with user.username, user.password
    visit yours_videos_path
    expect(page).to have_content('Latest videos')
    expect(page).to have_content(video.title)
  end
end
