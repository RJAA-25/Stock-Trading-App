Rails.application.routes.draw do
  # Root Page
  root to: "pages#home"

  # Devise Routes
  devise_for :users, module: "users", skip: [:sessions]
  devise_scope :user do
    get "login" => "users/sessions#new", as: :new_user_session
    post "login" => "users/sessions#create", as: :user_session
    delete "logout" => "users/sessions#destroy", as: :destroy_user_session
    get "register" => "users/registrations#new", as: :register
    get ":role/profile/edit" => "users/registrations#edit", as: :user_edit
  end

  # Trader Routes
  scope "trader" do
    get "dashboard" => "traders#dashboard", as: :trader_dashboard
    resources :portfolio, only: [:index, :create]
    resources :transactions, only: [:index]
  end

  # Admin Routes
  scope "admin" do
    get "dashboard" => "admins#dashboard", as: :admin_dashboard
    resources :accounts
    patch "accounts/:id/approve" => "accounts#approve", as: :approve_account
  end

  # Shared Routes
  scope "market" do
    resources :stocks, only: [:index, :show]
    post "stocks" => "stocks#check", as: :check_stock
  end
end
