Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'pages#index' 

    get "/categories/:id", to: "articles#categories", as: "categories" 	 

  resources :articles do
  	resources :article_comments
  	end

end
