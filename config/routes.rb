Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  devise_for :users

end
