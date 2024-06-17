Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about', as: "about"
  get '/home/rule' => 'homes#rule', as: "rule"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit]
  resources :image_icons, only: [:new, :create, :index, :show, :destroy]
  resources :questions
 
end
