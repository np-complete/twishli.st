Rails.application.routes.draw do
  constraints subdomain: 'admin' do
    devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
    resource :user, only: %i(show update), path: '/'
  end

  root 'top#index'
  get '/:id', to: 'top#show', as: :wishlist
end
