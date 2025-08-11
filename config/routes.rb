Rails.application.routes.draw do
  scope module: :public do
    devise_for :users, controllers: {
      registrations: 'public/registrations'
    }

    root to: 'homes#top'
    get '/myposts' => 'post_blogs#myposts', as: 'myposts'
    get 'about' => 'homes#about', as: 'about'
    
    resources :post_blogs, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      
      collection do
        get 'search'
      end
    end

    resources :users do
      resources :post_blogs, only: [:index, :show]
    end
  end



devise_for :admin, skip: [:registrations, :password], controllers: {
  sessions: 'admin/sessions'
}

namespace :admin do
  resources :users, only: [:index, :destroy]
  resources :post_blogs, only: [:index, :destroy]
  resources :post_comments, only: [:index, :destroy]
  get 'dashboard', to: 'dashboards#index'
end

end
