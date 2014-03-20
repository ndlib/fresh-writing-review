FreshWriting::Application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'issues#current'

  get 'public/:action' => 'public'

  resources :markdown_contents, :controller => :markdown, :only => [:show]

  namespace :admin do
    resources :markdown_contents, :controller => :markdown, :only => [:new, :create, :edit, :update]
    resources :issues, only: [:index, :new, :create, :edit, :update]
    post 'media/upload', to: 'markdown#add_image'
  end


  resources :errors, only: [:index, :show, :update]

  get :essays, to: 'search#index'

  resources :issues, only: [:index, :show] do
    member do
      get :editorial_board, path: "editorial-board"
      get :acknowledgments
      get :editorial_notes, path: "note"
    end

    resources :essays, only: [:index, :show ] do
      member do
        get :transcript
        get :instructor_resources
      end
    end
    resources :essay_styles, only: [:show], path: "style"
    resources :essay_awards, only: [:show], path: "award"
  end

  resources :pages, path: "/", only: :show
end
