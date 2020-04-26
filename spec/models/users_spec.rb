# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associaitons' do
    it { is_expected.to have_many(:videos).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to allow_value('kienphan').for(:username) }
    it { is_expected.to_not allow_value('kienphan@gmail.com').for(:username) }

    context 'valid record' do
      subject { build(:user) }
      it { is_expected.to be_valid }
    end

    describe 'invalid record' do
      context 'email invalid' do
        subject { build(:user, email: '') }

        it { is_expected.to be_invalid }
      end

      context 'username invalid' do
        subject { build(:user, username: '') }

        it { is_expected.to be_invalid }
      end

      context 'username includes special characters' do
        subject { build(:user, username: 'kienphan@abcxyz.com') }

        it { is_expected.to be_invalid }
      end
    end
  end

  describe 'Instance methods' do
    context '#login' do
      let(:user) { create(:user, username: 'kienphan') }
      subject { user.login }

      it { is_expected.to eq('kienphan') }
    end
  end

  describe 'Class methods' do
    let!(:user) { create(:user, username: 'kienphan') }
    context '#self.find_first_by_auth_conditions' do
      context 'with login' do
        subject { described_class.find_first_by_auth_conditions({ login: 'kienphan' }) }

        it { is_expected.to eq(user) }
      end
      context 'with email' do
        let!(:user1) { create(:user) }
        subject { described_class.find_first_by_auth_conditions({ email: user1.email }) }

        it { is_expected.not_to eq(user) }
        it { is_expected.to eq(user1) }
      end

      context 'with username' do
        let!(:user1) { create(:user) }
        subject { described_class.find_first_by_auth_conditions({ username: 'kienphan' }) }

        it { is_expected.not_to eq(user1) }
        it { is_expected.to eq(user) }
      end
    end
  end
end
