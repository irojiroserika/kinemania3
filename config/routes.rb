Rails.application.routes.draw do
  get 'actors/index'
  post "actors/new" => "actors#new"
  post "actors/create" => "actors#create"
  get "actors/:id" => "actors#show"
  
  
  
  get 'contents/index' => "contents#index"
  get "contents/new" => "contents#new"
  get "contents/:id/edit" => "contents#edit"
  post "contents/create" => "contents#create"
  get "contents/:id" => "contents#show"
  post "contents/:id/update" => "contents#update"
  
  
  
  get "/"  => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
