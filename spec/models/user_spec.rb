require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#url=' do
    subject { build :user, url: url }
    context 'valid url' do
      let(:url) { 'http://www.amazon.co.jp/registry/wishlist/1M1A2QYCBSGQ9' }
      it { is_expected.to be_valid }
    end

    context 'https' do
      let(:url) { 'https://www.amazon.co.jp/registry/wishlist/1M1A2QYCBSGQ9' }
      it { is_expected.to be_valid }
    end

    context 'invalid' do
      let(:url) { 'http://www.amazon.com/registry/wishlist/hoge' }
      it { is_expected.not_to be_valid }
    end
  end
end
