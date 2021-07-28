Rails.application.routes.draw do
  resources :tickets
  mount Peek::Railtie => '/peek'
  root 'home#index'
end
