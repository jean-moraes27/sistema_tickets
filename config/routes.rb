Rails.application.routes.draw do
  mount Peek::Railtie => '/peek'
  root 'home#index'
end
