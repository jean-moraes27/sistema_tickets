Rails.application.routes.draw do
  resources :users
  resources :tickets

  get    'sign_in' => 'sessions#new'
  get    'ticket/close' => 'tickets#encerrar_ticket'
  post   'sign_in' => 'sessions#create'
  post   '/ticket/resposta', to: 'tickets#reply_resposta'
  delete 'sign_out' => 'sessions#destroy'
  mount Peek::Railtie => '/peek'
  root 'home#index'
end
