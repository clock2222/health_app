Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # root "posts#index"
  root "homes#index"
  resources :contacts, only: %i[index create]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :users, only: [:new, :show, :edit, :update] do
    member do
      get "likes"
    end
  end
  get "/mypage", to: "users#mypage"
  resources :statuses

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resource :like_comments, only: [:create, :destroy]
  end

  resources :hashtags do
    get "posts", to: "posts#search"
  end
end
