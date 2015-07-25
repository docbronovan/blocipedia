Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  devise_for :users, :controllers => { :registration => :registration }
  resources :users, only: [:update, :show, :index] do
    resources :items,  shallow: true
  end

  root :to => "welcome#index"

  get 'about' => 'welcome#about'
end
