Rails.application.routes.draw do
  
  root to: "index#index"
  get "/admin", to: 'index#admin'
  post "/admin", to: 'index#admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
