Rails.application.routes.draw do
  # get 'search_entries/index'
  # post '/search/:query' => 'search#index'
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # scope '/admin' do
  #   resources :users
  # end
  resources :adds do
    resources :comments
  end
  resources :users
  resources :roles
  authenticated :user do
    root to: 'adds#index', as: :authenticated_root
  end
  root to: 'adds#index'
  resources :search

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
