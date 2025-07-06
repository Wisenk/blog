Rails.application.routes.draw do
  get 'post_blogs/new'
  get 'post_blogs/edit'
  get 'post_blogs/show'
  get 'post_blogs/view'
  devise_for :users
root to: "homes#top"

  resources :post_blogs, only: [:new, :index, :show, :edit]
  get 'about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
