require 'rails_helper'

describe TopController do
  it { expect(get: '/').to route_to('top#index') }
  it { expect(get: '/masarakki').to route_to('top#show', id: 'masarakki') }
end
