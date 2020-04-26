# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  let(:user) { create(:user) }
  let!(:video) { create(:video) }

  scenario 'index page' do
    visit root_path
    expect(page).to have_content('Funny Videos')
  end

  scenario 'as a guest, I can see the jumbotron' do
    visit root_path
    expect(page).to have_content('Share your videos with the world!')
  end

  scenario 'as a guest, I need to move to login page to share a video' do
    visit root_path
    click_link('Share a video now!')
    expect(page).to have_content('Login')
  end

  scenario 'as an user, I can see welcome me on the navbar' do
    sign_in_with user.username, user.password

    expect(page).to have_content("Welcome #{user.email}")
  end

  scenario 'as an user or a guest, I can see latest videos' do
    visit root_path
    expect(page).to have_content('Latest videos')
    expect(page).to have_content(video.title)
  end

  scenario 'as an user, I can go to share a video page' do
    sign_in_with user.username, user.password
    visit root_path
    click_link('Share a video now!')
    expect(page).to have_content('Share a video from youtube')
    expect(page).to have_content('A link to the video on YouTube.')
  end
end
