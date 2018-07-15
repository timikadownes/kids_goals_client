Rails.application.routes.draw do
namespace :client do
  
  get "/kids/new" => "kids#new"
  get "/kids/:id" => "kids#show"
  post "/kids" => "kids#create"
  get "/kids/:id/edit" => "kids#edit"
  patch "/kids/:id" => "kids#update"
  delete "kids/:id" => "kids#destroy"  
  
  get "/goals/new" => "goals#new"
  get "/goals/:id" => "goals#show"
  post "/goals" => "goals#create"
  get "/goals/:id/edit" => "goals#edit"
  patch "/goals/:id" => "goals#update"
  delete "goals/:id" => "goals#destroy"
  
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  get "/users/:id" => "users#show"
  end 
end
