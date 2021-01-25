Rails.application.routes.draw do
  root to: "top#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
end