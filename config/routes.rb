NewBarcode::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :students

  root :to => "students#index"
end
