FreshWriting::Application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'issues#current'

  get 'public/:action' => 'public'

  resources :markdown_contents, :controller => :markdown, :only => [:show]

  namespace :admin do
    get '/', to: redirect('/admin/volumes')

    resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
    resources :pages do
      resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
    end
    resources :essay_awards, only: [ :new, :create, :edit, :update, :show ] do
      resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
    end
    resources :issues, path: "volumes" do
      member do
        put 'publish'
        put 'unpublish'
      end
      resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
      resources :essays, except: [:index] do
        member do
          put 'publish'
          put 'unpublish'
        end
        resources :attached_files, except: [ :index ]
        resources :essay_awards, only: [ :new, :create, :edit, :update ]
        resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
      end
    end
    resources :editors
    post 'media/upload', to: 'markdown#add_image'
  end


  resources :errors, only: [:index, :show, :update]

  get :essays, to: 'search#index', as: :essay_search

  resources :issues, path: "volumes", only: [:index, :show] do
    member do
      get :editorial_board, path: "editorial-board"
      get :acknowledgements
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
