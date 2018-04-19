# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

resources :users do
  resources :posts do
    resources :comments
  end
end

  get '/feed', to: 'posts#feed'

  # leads home
  get '/' => 'users#index'
  get '/users' => 'user/#index'

  #leads to user account page
  get '/users' => 'users#show'

  #leads to posts
  get '/posts' => 'users#posts'

  #leads to account; where settings can be edited
  get '/account' => 'users#account'

  #creates new post
  post '/posts' => 'post#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  root 'users#index'

end
