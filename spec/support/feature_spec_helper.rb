# typed: true
# frozen_string_literal: true

module FeatureSpecHelper
  include Warden::Test::Helpers

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  def sign_up_with(email, username, password)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

  def sign_in_with(username, password)
    visit new_user_session_path
    fill_in 'login', with: username
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end
end

RSpec.configure do |config|
  config.include FeatureSpecHelper, type: :feature
end
