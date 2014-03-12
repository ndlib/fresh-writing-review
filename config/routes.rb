FreshWriting::Application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'issues#current'

  get 'public/:action' => 'public'

  resources :markdown_contents, :controller => :markdown, :only => [:show]

  scope :admin do
    resources :markdown_contents, :controller => :markdown, :only => [:new, :create, :edit, :update]
  end

  resources :errors

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
      end
    end
    resources :essay_styles, only: [:show], path: "style"
  end

  resources :pages, path: "/", only: :show
end
