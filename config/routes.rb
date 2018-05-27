Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: 'pages#home'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get "/participants", to: "pages#participants"
  get "/contact", to: "pages#contact"

end
