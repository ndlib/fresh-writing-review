class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ControllerErrorTrapping

  unless Rails.configuration.consider_all_requests_local
    setup_controller_errors
  end

  # these are used to allow cross site scripting in the development environment
  # Access-Control-Allow-Origin is being set in apache for prod / preprod
  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = 'PUT, GET, POST, DELETE, OPTIONS'
  end

  protected
    def authenticate_user!
      if session[:netid]
        super
      else
        redirect_to user_omniauth_authorize_path(:oktaoauth)
      end
    end

  private
    def authorize_ability!(ability_name, object)
      ability = Ability.new(current_user)
      ability.authorize!(ability_name, object)
    end

    def authorize_read_issue!(issue)
      authorize_ability!(:read, issue)
    end

    def authorize_read_essay!(essay)
      authorize_ability!(:read, essay)
    end

    def authorize_editor!
      authorize_ability!(:edit, :all)
    end

    def authorize_superuser!
      authorize_ability!(:manage_users, :all)
    end

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      Rails.application.secrets.okta['logout_url']
    end

    # post Okta login send user to this route
    def after_sign_in_path_for(resource_or_scope)
      "/admin/volumes"
    end
end
