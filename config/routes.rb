FreshWriting::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

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
    resources :awards do
      resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
    end
    resources :essay_styles do
      resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
    end
    resources :issues, path: "volumes" do
      member do
        put 'publish'
        put 'unpublish'
        get 'edit_images'
        put 'save_images'
        put 'remove_pdf'
      end
      resources :markdown_contents, :controller => :markdown, :only => [:edit, :update]
      resources :essays, except: [:index] do
        member do
          put 'publish'
          put 'unpublish'
          put 'highlight'
          put 'unhighlight'
          get 'edit_images'
          put 'save_images'
        end
        resources :attached_files, except: [ :index ]
        resources :essay_awards, except: [ :index, :show ]
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
      get :submission_guidelines, path: "submission-guidelines"
    end

    resources :essays, only: [:index, :show ] do
      member do
        get :transcript
        get :instructor_resources
      end
    end
    resources :essay_styles, only: [:show], path: "style"
    resources :awards, only: [:show], path: "award"
  end

  resources :pages, path: "/", only: :show
end
