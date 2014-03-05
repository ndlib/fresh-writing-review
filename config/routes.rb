FreshWriting::Application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'public#home'

  get 'public/:action' => 'public'

  resources :pages, :controller => :page, :only => [:show]

  scope :admin do
    resources :pages, :controller => :page, :only => [:new, :create, :edit, :update]
  end

  resources :errors

  resources :essays
end
