Rails.application.routes.draw do

  root 'home#home'

  get '/home', :to => "home#home"

  scope '/users'  do
    resources :sessions
    resources :registrations
  end

  resources :activation, :only => [:new, :create, :edit, :update]
  get '/account_activation/:id', :to => 'registrations#activate_account', :as => :activate_account
  resources :password_reset, :only => [:create, :edit, :update, :new]

  resources :exams do
    resources :questions, :only => [:create, :destroy]
    resources :exam_sheets, :only => [:index, :show, :create, :new, :destroy]
    resources :exam_shares, :only => [:new, :create]
  end


end
