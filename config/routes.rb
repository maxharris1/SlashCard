Rails.application.routes.draw do


  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :vendors
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  get '/vendorportal/:id', to: 'vendors#vendorportal', as: 'vendorportal'


  devise_scope :user do
    get 'createvendor', to: 'vendors#new'
  end
  devise_scope :user do
    get 'destroyvendor', to: 'vendors#destroy'
  end

  get 'profile', to: 'users#profile'
  get 'schoolsindex', to: 'pages#schools'

  get 'buycard', to: 'pages#buycard'

  get 'campusambassador', to: 'pages#campusambassador'

  get 'faq', to: 'pages#faq'



end
