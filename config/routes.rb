require 'sidekiq/web'

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations',
    passwords: 'user/passwords'
  }
  mount Sidekiq::Web, at: '/sidekiq'
  root 'home#index'
  get 'about', controller: 'home'
  resources :posts
  resources :contacts
  resources :projects
end
