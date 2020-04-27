# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show video page', type: :feature do
  let(:user) { create(:user) }
  let!(:video) { create(:video, user: user) }

  before do
    3.times { create(:comment, user: user, video: video) }
  end

  scenario 'as a guest or an user, I can see all comments of video' do
    visit video_path(video)
    expect(page).to have_content(video.title)
    expect(page).to have_content('Comments')
    expect(page).to have_content(video.comments.last.body)
  end

  scenario 'as a guest or an user, I go to detail video page I can see a form to add new comment' do
    visit video_path(video)
    expect(page).to have_content(video.title)
    expect(page).to have_content('Add new comment')
  end

  scenario 'as an user, I can add a new comment' do
    sign_in_with user.username, user.password
    visit video_path(video)
    fill_in 'Body', with: 'some awesome comments'
    click_button 'Comment'
    expect(page).to have_content("You're added a comment sucessful!")
    expect(page).to have_content('some awesome comments')
  end
end
