require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  let(:url) { 'http://www.amazon.co.jp/registry/wishlist/ABCD12345' }
  before { sign_in user }
  before { request.host = "admin.#{request.domain}" }

  describe 'PUT :update' do
    let(:request!) { put :update, user: { url: url } }
    it do
      request!
      expect(response).to redirect_to(user_url)
    end

    it do
      request!
      expect { user.reload }.to change { user.url }.to(url)
    end
  end
end
