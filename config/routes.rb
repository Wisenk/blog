Rails.application.routes.draw do
devise_for :users
root to: 'homes#top'

resources :post_blogs, only: [:new, :create, :index, :show, :edit]
resources :users, only: [:show, :edit, :update], path: 'profiles'

resources :post_blogs do
  collection do
    get 'search'
  end
end


  get 'about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
