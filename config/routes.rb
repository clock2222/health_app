Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "posts#index"
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

  resources :posts do
    resource :likes, only: [:create, :destroy]
  end

  get "post/hashtag/:name", to: "posts#hashtag"
  get "post/hashtag", to: "posts#hashtag"

  resources :categories do
    collection do
      get "get_category_children", defaults: { format: "json" }
      get "get_category_grandchildren", defaults: { format: "json" }
      get "menu_search"
    end
    member do
      get "item_search"
    end
  end
end
