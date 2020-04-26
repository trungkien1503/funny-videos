# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideoObserver, type: :model do
  let(:user) { create(:user, username: 'kienphan') }

  context 'Should get data of video from youtube' do
    let(:video) { build(:video, user: user, title: nil, description: nil, published_at: nil) }

    before do
      video.save
      video.reload
    end

    it { expect(video.title).to be_present }
    it { expect(video.description).to be_present }
    it { expect(video.published_at).to be_present }
    it { expect(video.likes).to be_present }
    it { expect(video.dislikes).to be_present }
  end

  context 'when link is invalid should get nothing' do
    let(:video) { build(:video, user: user, link: '', title: nil, description: nil, published_at: nil) }

    before do
      video.save
    end

    it { expect(video.title).to be_blank }
    it { expect(video).to be_invalid }
  end
end
