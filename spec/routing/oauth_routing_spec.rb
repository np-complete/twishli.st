require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :routing do
  let(:admin) { 'http://admin.domain.com' }
  describe 'route to #start' do
    it { expect(get: '/users/auth/twitter').not_to be_routable }
    it { expect(get: "#{admin}/users/auth/twitter").to route_to('omniauth_callbacks#passthru', subdomain: 'admin') }
    it { expect(user_twitter_omniauth_authorize_url(host: 'domain.com')).to eq "#{admin}/users/auth/twitter" }
  end
  describe 'route to #callback' do
    it { expect(get: '/users/auth/twitter/callback').not_to be_routable }
    it { expect(get: "#{admin}/users/auth/twitter/callback").to route_to('omniauth_callbacks#twitter', subdomain: 'admin') }
  end
end
