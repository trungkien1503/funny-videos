# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associaitons' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:video) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
