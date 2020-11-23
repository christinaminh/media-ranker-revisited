Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "works#root"

  resources :works
  post "/works/:id/upvote", to: "works#upvote", as: "upvote"

  resources :users, only: [:index, :show]


  # OmniAuth login route
  get '/auth/github', as: 'github_login'

  # Omniauth callback route
  get '/auth/:provider/callback', to: 'users#create', as: 'omniauth_callback'

  # Logout
  delete '/logout', to: 'users#destroy', as: 'logout'
end
