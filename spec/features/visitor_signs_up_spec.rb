# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor signs up', type: :feature do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'validusername', 'password'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'validusername', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with invalid username' do
    sign_up_with 'valid@example.com', 'invalidusername@abc.com', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', 'validusername', ''

    expect(page).to have_content('Log in')
  end

  scenario 'with too short password' do
    sign_up_with 'valid@example.com', 'validusername', '123'

    expect(page).to have_content('Log in')
  end
end
