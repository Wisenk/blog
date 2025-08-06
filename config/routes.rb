Rails.application.routes.draw do
devise_for :users
root to: 'homes#top'

get '/myposts' => 'post_blogs#myposts', as: 'myposts'
get 'about' => 'homes#about', as: 'about'

resources :post_blogs do
  resources :post_comments
  
  collection do
    get 'search'
  end
end

resources :users, only: [:show, :edit, :update], path: 'profiles'
end
