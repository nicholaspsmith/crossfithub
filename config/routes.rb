Crossfithub::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'users#index'

  resources :users do
    resources :completions
  end
  resources :completions

  post 'user/:id' => 'completions#create'

  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
  get 'users/', to: 'users#follow', as: 'follow'

end
