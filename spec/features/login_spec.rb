# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign in', type: :feature do
  let!(:user) { create(:user) }

  scenario 'with valid username and password' do
    sign_in_with user.username, user.password

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with valid email and password' do
    sign_in_with user.email, user.password

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with valid username and wrong password' do
    sign_in_with user.username, 'wrong password'

    expect(page).to have_content('Invalid Login or password.')
  end

  scenario 'with valid username and blank password' do
    sign_in_with user.username, ''

    expect(page).to have_content('Invalid Login or password.')
  end
end
