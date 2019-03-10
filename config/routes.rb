Rails.application.routes.draw do

 get 'listings/vehicles' => 'listings#vehicle_index'
 get 'listings/vehicles/:id' => 'listings#vehicle_show', as: 'vehicle_listing'
 
 devise_for :admins
 get 'admin' => 'vehicles#index'
 scope :admin do
     resources :vehicles do

  	     resources :vehicle_photos do
  	     	delete 'delete_media', to: "vehicle_photos#delete_media"
  	     	post :update_row_order, on: :collection
  	     end
  	     mount Ckeditor::Engine => '/ckeditor'
  end
end

 root 'pages#home'
end
