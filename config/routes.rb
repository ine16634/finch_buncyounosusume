Rails.application.routes.draw do

   devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'}

  namespace :admin do
    resources :categories, except: [:new, :show]
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] do
        member do
            get "check"
            #ユーザーの会員状況を取得
            patch "withdrawl"
            #ユーザーの会員状況を更新
            patch "unwithdrawl"
        end
    end
  end


  scope module: :public do
    get 'answers/new'
    devise_for :users
    root to: 'homes#top'
    get '/home/about' => 'homes#about', as: "about"
    get '/home/rule' => 'homes#rule', as: "rule"


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
      resources :answers, only: [:new,:create]
    end
  # collection do
    #  post :confirm
   # end
 #end
  end
end
