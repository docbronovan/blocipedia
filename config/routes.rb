Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  resources :wikis

  devise_for :users, :controllers => { :registration => :registration }
  resources :users, only: [:update, :show, :index] do
    resources :wikis,  shallow: true
  end

  root :to => "welcome#index"

  get 'about' => 'welcome#about'
end
