FreshWriting::Application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'public#home'

  get 'public/:action' => 'public'

  resources :markdown_contents, :controller => :markdown, :only => [:show]

  scope :admin do
    resources :markdown_contents, :controller => :markdown, :only => [:new, :create, :edit, :update]
  end

  resources :errors



  resources :issues, only: [:index, :show] do
    member do
      get :editorial_board, path: "editorial-board"
      get :acknowledgments
      get :editorial_notes, path: "note"
    end

    resources :essays do
      get :transcript
    end
    resources :essay_styles, only: [:show], path: "style"
  end
end
