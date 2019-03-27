Rails.application.routes.draw do

 get 'listings/vehicles' => 'listings#vehicle_index'
 get 'listings/vehicles/:id' => 'listings#vehicle_show', as: 'vehicle_listing'

 get 'contact', to: 'contacts#new'
 resource "contact", only: [:new, :create]
 resolve('Contact') { [:contact] }


  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end
 
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
