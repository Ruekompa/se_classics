Rails.application.routes.draw do
 
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  resources :vehicles do
  	resources :vehicle_photos, :only => [:create, :destroy]
  end

 root 'pages#home'
end
