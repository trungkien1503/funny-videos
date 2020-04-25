# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('Funny Videos')
  end
end
