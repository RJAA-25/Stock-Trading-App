Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, module: "users", skip: [:sessions]
  devise_scope :user do
    get "login" => "users/sessions#new", as: :new_user_session
    post "login" => "users/sessions#create", as: :user_session
    delete "logout" => "users/sessions#destroy", as: :destroy_user_session
    get "register" => "users/registrations#new", as: :register
    get ":role/profile/edit" => "users/registrations#edit", as: :user_edit
  end
  scope "trader" do
    get "dashboard" => "traders#dashboard", as: :trader_dashboard
  end
  scope "admin" do
    get "dashboard" => "admins#dashboard", as: :admin_dashboard
    resources :accounts
  end
end
