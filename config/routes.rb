Portfolio::Application.routes.draw do
  devise_for :users
  # devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'signup' }
  # get 'signup', to: 'users#new', as: 'signup'
  # get 'login', to: 'sessions#new', as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'  # NOTE: this 'get' should be a 'delete'
  devise_scope :user do
    # get "signup", :to => "devise/registrations#new"
    get "signout", :to => "devise/sessions#destroy"
    # get "signin", :to => "devise/sessions#new"
  end

  resources :posts
  resources :projects

  root :to => 'home#index'


  # See how all your routes lay out with "rake routes"

end
