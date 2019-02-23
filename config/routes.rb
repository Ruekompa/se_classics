Rails.application.routes.draw do
 
  devise_for :admins
  resources :vehicles

 root 'pages#home'
end
