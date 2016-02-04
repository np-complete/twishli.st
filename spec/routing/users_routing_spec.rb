require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  let(:admin) { 'http://admin.domain.com' }
  describe 'route to #show' do
    it { expect(get: "#{admin}/").to route_to('users#show', subdomain: 'admin') }
    it { expect(user_url(host: 'domain.com')).to eq "#{admin}/" }
  end

  describe 'route to #update' do
    it { expect(put: "#{admin}/").to route_to('users#update', subdomain: 'admin') }
  end
end
