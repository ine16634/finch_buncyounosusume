Rails.application.routes.draw do

  get 'answers/new'
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about', as: "about"
  get '/home/rule' => 'homes#rule', as: "rule"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]
  #resources :image_icons, only: [:new, :index, :show, :destroy]
  resources :questions do
    resources :answers, only: [:new,:create]
  end
  # collection do
    #  post :confirm
   # end
 #end


 end
