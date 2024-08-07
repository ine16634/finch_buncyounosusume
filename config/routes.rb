Rails.application.routes.draw do

   devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'}

  namespace :admin do
    resources :categories, except: [:new, :show]
    get 'dashboards', to: 'dashboards#index'
    get "search" => "searches#search"

    resources :users, only: [:destroy] do
        member do
            get "check"
            #ユーザーの会員状況を取得
            patch "withdrawl"
            #ユーザーの会員状況を更新
            patch "unwithdrawl"
        end
    end
    resources :questions, only: [:destroy, :index]

  end


  scope module: :public do

    devise_for :users
    root to: 'homes#top'
    get '/home/about' => 'homes#about', as: "about"
    get '/home/rule' => 'homes#rule', as: "rule"

    get "search" => "searches#search"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :users, only: [:show, :edit, :update] do
        member do
            get "check"
            #ユーザーの会員状況を取得
            patch "withdrawl"
            #ユーザーの会員状況を更新

        end
    end

    #resources :image_icons, only: [:new, :index, :show, :destroy]
    resources :questions do
      resources :answers, only: [:new, :create, :destroy] do
        resources :answer_comments, only: [:create, :destroy]
       end
    end
    resources :answer_comments, only: [:create, :destroy]
  # collection do
    #  post :confirm
   # end
    get '/categories' => 'categories#index'
    get '/categories/before' => 'categories#before' ,as: "before"
    get '/categories/breeding' => 'categories#breeding' ,as: "breeding"
    get '/categories/knowledge' => 'categories#knowledge' ,as: "knowledge"
    get '/categorie/food' => 'categories#food' ,as: "food"
    get '/categories/illness' => 'categories#illness' ,as: "illness"
    get '/categories/others' => 'categories#others' ,as: "others"

 #end
  end
end
