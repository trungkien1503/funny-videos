# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User log out', type: :feature do
  let!(:user) { create(:user) }
  before { sign_in_with user.username, user.password }

  scenario 'by click Logout' do
    click_on 'Logout'

    expect(page).to have_content('Signed out successfully.')
  end
end
