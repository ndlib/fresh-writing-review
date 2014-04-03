class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  include ControllerErrorTrapping

  unless Rails.configuration.consider_all_requests_local
    setup_controller_errors
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
