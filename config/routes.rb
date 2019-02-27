Rails.application.routes.draw do

 get 'vehicles' => 'listings#vehicle_index'
 get 'vehicles/:id' => 'listings#vehicle_show', as: 'vehicle_listing'
 
 get 'admin' => 'vehicles#index'
 devise_for :admins
 scope 'admin' do
  mount Ckeditor::Engine => '/ckeditor'
  resources :vehicles do
  	resources :vehicle_photos, :only => [:create, :destroy]
  end
end

 root 'pages#home'
end
