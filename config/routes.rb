Rails.application.routes.draw do
 
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  resources :vehicles

 root 'pages#home'
end
