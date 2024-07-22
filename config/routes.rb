Rails.application.routes.draw do
  get 'user/show'
  get 'gossip/show'
  get 'home/index'
  get 'welcome/index'
  get 'contact/index'
  get 'team/index'
  get 'team', to: 'team#index'
  get 'contact', to: 'contact#index'
  get 'welcome/:first_name', to: 'welcome#index'
  root 'home#index'
  get 'gossips/:id', to: 'gossip#show'
  get 'users/:id', to: 'user#show'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :potins, only: [:index, :new, :create, :show]
  resources :potins, only: [:index, :show, :new, :create, :edit, :update]
  resources :potins, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :potins do
    resources :comments, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
