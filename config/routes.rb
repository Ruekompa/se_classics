Rails.application.routes.draw do
 
  devise_for :admins
  get 'vehicles' => 'vehicles#index'
  # get 'vehicles#show'
  # get 'vehicles#new'
  # get 'vehicles#edit'
 root 'pages#home'
end
