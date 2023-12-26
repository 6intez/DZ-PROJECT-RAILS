Rails.application.routes.draw do
  resources :availabilities, only: [:destroy]

  devise_for :admins
  devise_for :users
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  get 'my_account/view'
  get 'admin/input'
  get 'admin/view'
  get 'availabilities/index'
  post 'availabilities/destroy'
  get 'masters/available_times'
  get 'appointment1/index'
  get 'appointment1/view'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'static_pages#home'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
