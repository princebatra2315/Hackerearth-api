Rails.application.routes.draw do
  resources :users
  root  'getuser#get_user'
  get 'getuser/get_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
