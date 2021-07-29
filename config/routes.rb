Rails.application.routes.draw do
  resources :users
  resources :tickets

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  mount Peek::Railtie => '/peek'
  root 'home#index'
end
