Rails.application.routes.draw do


  devise_for :managers, :controllers => {:registrations => "manager/registrations", :sessions => "manager/sessions", :passwords => "manager/passwords" }
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :vendors do
    resources :discounts
  end
  resources :schools
  resources :discounts
  resources :redeemables
  resources :exclrewards
  resources :reviews do
    resource :like, module: :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'createvendor', to: 'vendors#new'
    get 'destroyvendor', to: 'vendors#destroy'

  end

  devise_scope :manager do
    get 'managerlogin', to: 'manager/sessions#new'
    get 'managersignup', to: 'manager/registrations#new'
    get 'portal', to: 'manager#portal'


  end

  get'/getLoc', to: 'schools#getLoc', as: :getLoc

  post '/redeem/:id', to: 'redeemables#redeem', as: 'redeem_auth'
  # get 'getLoc', to: 'schools#getLoc'
  get '/pendingdiscounts/:id/', to: 'vendors#pendingdiscounts', as: 'pending_discounts'
  get '/vendorportal/:id', to: 'vendors#vendorportal', as: 'vendorportal'
  get "/scan/:id", to: 'vendors#scan', as: 'scan'
  get 'redeem_discount/:id', to: 'users#redeem_discount', as: 'redeem_discount'
  get 'redeem', to: 'users#redeem', as: 'redeem'
  get 'profile', to: 'users#profile'
  get 'schoolsindex', to: 'pages#schools'

  get 'buycard', to: 'pages#buycard'

  get 'campusambassador', to: 'pages#campusambassador'

  get 'faq', to: 'pages#faq'



end
