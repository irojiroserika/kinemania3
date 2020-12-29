Rails.application.routes.draw do
  get 'users/new'  => "users#new"
  post "users/create" => "users#create"
  get "users/index" => "users#index"
  
  get 'actors/index'
  post "actors/new" => "actors#new"
  post "actors/create" => "actors#create"
  get "actors/:id" => "actors#show"
  get "actors/:id/edit" => "actors#edit"
  post "actors/:id/update" => "actors#update"
  
  get 'contents/index' => "contents#index"
  get "contents/new" => "contents#new"
  get "contents/:id/edit" => "contents#edit"
  post "contents/create" => "contents#create"
  get "contents/:id" => "contents#show"
  post "contents/:id/update" => "contents#update"
  
  
  
  get "/"  => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
