Rails.application.routes.draw do
  
  get 'tranzaction/show'
  get 'con/refresh'
  get 'con/reconect'
  get 'con/delete'
  get 'con/index'
  get 'delconnections/new'
  get 'delconnections/show'
  get 'customercreates/show'
  get 'createconnections/show'
  #get 'showconnections/show'
  get 'delete_conections/show'
  #devise_for :users
  	root to:'homes#index'
  	#get '/home', to: 'homes#index'

  	get '/account', to: 'accounts#new'
  	post '/account', to: 'accounts#show'

  	get '/showcustomer', to:'showcustomers#show'

  	devise_for :users

	devise_scope :user do  
   		get '/users/sign_out' => 'devise/sessions#destroy'     
	end
  #resources :actions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
