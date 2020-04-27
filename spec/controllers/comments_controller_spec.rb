# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:video) { create(:video, user: user) }

  describe 'POST #create' do
    before do
      sign_in(user)
      post :create, params: { comment: { body: 'this is a comment' }, video_id: video.id }
    end

    it { is_expected.to respond_with(:found) }
  end
end
