Rails.application.routes.draw do
  #devise_for :users, controllers: {
  #  registrations: 'public/registrations',
  #  sessions: 'public/sessions',
  #  passwords: 'public/passwords'
  #}

  #devise_for :admins, path: "admin", skip: [:registrations, :password], controllers: {
  #  sessions: 'admin/sessions'
  #}

  scope module: :public do
    devise_for :users, controllers: {
      registrations: 'public/registrations'
    }

    root to: 'homes#top'
    get '/myposts' => 'post_blogs#myposts', as: 'myposts'
    get 'about' => 'homes#about', as: 'about'
    
  
    resources :post_blogs, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
      
      collection do
        get 'search'
      end
    end

    resources :users do
      resources :post_blogs, only: [:index, :show]
      #member do
      #  get :post_blogs
      #  get :favorites
      #  get :followings
      #  get :followers
      #end
    end
  end





namespace :admin do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  resources :users, only: [:index, :destroy]
  resources :post_blogs, only: [:index, :destroy]
  resources :post_comments, only: [:index, :destroy]
  get 'dashboard', to: 'dashboards#index'
end

end
