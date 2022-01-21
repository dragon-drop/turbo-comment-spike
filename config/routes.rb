Rails.application.routes.draw do
  resources :comments, only: %i[new create show] do
    resources :likes, on: :member, only: %i[create destroy]
  end
  root to: 'comments#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
