Rails.application.routes.draw do

 get 'vehicles' => 'listings#vehicle_index'
 get 'vehicles/:id' => 'listings#vehicle_show', as: 'vehicle_listing'
 
 get 'admin' => 'vehicles#index'
 scope 'admin' do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  resources :vehicles do
  	resources :vehicle_photos, :only => [:create, :destroy]
  end
end

 root 'pages#home'
end
