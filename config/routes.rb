Rails.application.routes.draw do
  	
  	root "home#index"

  	resources :services, only:[:index, :new, :create, :destroy, :edit, :update]

  	get "services/open" => "services#open"
  	get "services/:id/finish" => "services#finish", as: :finish_service
  	get "services/search" => "services#search"

  	get "services/:id" => "services#show"
  	
end
