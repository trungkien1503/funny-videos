# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'Associaitons' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:link) }
  end

  describe 'Instance methods' do
    let(:user) { create(:user, username: 'kienphan') }
    let!(:video) { create(:video, user: user) }

    context '#image_url' do
      subject { video.image_url }

      it { is_expected.to be_present }
    end

    context '#watch_url' do
      subject { video.watch_url }

      it { is_expected.to be_present }
    end

    context '#embed_url' do
      subject { video.embed_url }

      it { is_expected.to be_present }
    end
  end
end
