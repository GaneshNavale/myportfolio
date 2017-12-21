Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  root 'home#index'
  resources :contacts
  resources :posts
  resources :portfolio
  resource :contact
end
