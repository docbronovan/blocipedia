Rails.application.routes.draw do
  
  resources :collaborators, only: [:edit, :index, :new, :show]
  resources :charges, only: [:new, :create]
  resources :wikis

  devise_for :users, :controllers => { :registration => :registration }
  resources :users, only: [:update, :show, :index] do
    resources :wikis,  shallow: true do
      resources :collaborators, shallow: true 
      end
  end

  root :to => "welcome#index"
  get 'about' => 'welcome#about'
end
