# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do


resources :users do
  resources :posts
end

  get '/feed', to: 'posts#feed'

  # leads home
  get '/' => 'users#index'
  get '/users' => 'user/#index'



  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'users#index'

end
