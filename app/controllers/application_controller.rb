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
end
