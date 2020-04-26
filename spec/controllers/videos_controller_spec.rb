# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with(:success) }
    it { should render_template('index') }
  end

  describe 'GET #grid_view' do
    before { get :grid_view }

    it { is_expected.to respond_with(:success) }
    it { should render_template('grid_view') }
  end

  describe 'non loggedin user' do
    describe 'GET #yours' do
      before { get :yours }

      it { is_expected.to respond_with(:found) }
    end

    describe 'GET #new' do
      before { get :new }

      it { is_expected.to respond_with(:found) }
    end
  end

  describe 'loggedin user' do
    before do
      sign_in(user)
    end

    describe 'GET #new' do
      before { get :new }

      it { is_expected.to respond_with(:success) }
    end

    describe 'GET #yours' do
      before { get :yours }

      it { is_expected.to respond_with(:success) }
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        let(:video) { build(:video) }

        def call_post
          post :create, params: {
            video: { link: video.link }
          }
        end

        before { call_post }

        it do
          expect { call_post }.to change { Video.count }
        end
        it { is_expected.to respond_with(:found) }
      end

      context 'with invalid attributes' do
        def call_post
          post :create, params: {
            video: { link: '' }
          }
        end

        before { call_post }

        it { is_expected.to respond_with(:success) }
        it do
          expect { call_post }.not_to change { Video.count }
        end
        it { should render_template('new') }
      end
    end
  end

  describe 'logout user' do
    before do
      sign_in(user)
      sign_out(user)
    end

    describe 'GET #yours' do
      before { get :yours }

      it { is_expected.not_to respond_with(:success) }
    end
  end
end
