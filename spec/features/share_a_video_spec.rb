# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Share a video page', type: :feature do
  let(:user) { create(:user) }
  let(:video) { build(:video) }

  scenario 'as a guest, when I goto share a video page, the website redirect me to login page' do
    visit share_path
    expect(page).to have_content('Login')
  end

  scenario 'as an user, I can go to share a video page' do
    sign_in_with user.username, user.password
    visit share_path
    expect(page).to have_content('Share a video from youtube')
    expect(page).to have_content('A link to the video on YouTube.')
  end

  scenario 'as an user, I can share a valid link video' do
    sign_in_with user.username, user.password
    visit share_path
    fill_in 'Link', with: video.link
    click_button 'Share'
    expect(page).to have_content('Video added successful!')
  end

  scenario 'as an user, I can not share a invalid link video' do
    sign_in_with user.username, user.password
    visit share_path
    fill_in 'Link', with: 'its a fake youtube link'
    click_button 'Share'
    expect(page).not_to have_content('Video added successful!')
  end
end
