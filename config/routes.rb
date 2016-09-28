Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

  get '/articles' => 'articles#index'
  get '/articles/:id' => 'articles#show'
  post '/articles' => 'articles#create'
  # resources :articles, only: [:index]
end
