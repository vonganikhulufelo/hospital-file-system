Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  resources :password_resets

  resources :pharmacyrecords

  root 'sessions#new'
  #resources :sessions, only: [:create, :new]
  #get 'logout' => "sessions#destroy"
 

  get '/login',  to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/logout',  to: 'sessions#destroy'
  
  resources :hospitals do 
  	resources :administrators
  end

   resources :hospitals do 
     resources :nurses
  end
  
   resources :hospitals do 
     resources :doctors
  end
   resources :hospitals do 
   resources :pharmacists
  end
   resources :hospitals do 
    resources :receptionists
    resources :pharmacyrecords
  end
   resources :hospitals do 
    resources :pharmacies
  end
  resources :hospitals do 
     resources :wards
  end

  resources :patients do 
     resources :patientrecords
  end
  
  resources :hospitals do 
  resources :patients do 
    end
  end
end
