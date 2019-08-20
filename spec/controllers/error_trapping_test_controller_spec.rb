require 'spec_helper'
include ControllerErrorTrapping

class ErrorTrappingTestController < ApplicationController
  setup_controller_errors
end

describe ErrorTrappingTestController, :type => :controller  do

  describe 'routing_error' do

    controller(ErrorTrappingTestController) do
      def index
        raise ActionController::RoutingError.new("not found")
      end
    end


    it "catches a routing error correctly" do
      expect(controller).to receive(:catch_404)
      get :index
    end

  end


  describe 'unknown_controller' do

    controller(ErrorTrappingTestController) do
      def index
        raise ActionController::UnknownController.new("not found")
      end
    end


    it "catches a routing error correctly" do
      expect(controller).to receive(:catch_404)
      get :index
    end

  end


  describe 'record_not_found' do

    controller(ErrorTrappingTestController) do
      def index
        raise ActiveRecord::RecordNotFound.new("not found")
      end
    end


    it "catches a routing error correctly" do
      expect(controller).to receive(:catch_404)
      get :index
    end

  end


  describe 'action_not_found' do

    controller(ErrorTrappingTestController) do
      def index
        raise AbstractController::ActionNotFound.new("not found")
      end
    end


    it "catches a routing error correctly" do
      expect(controller).to receive(:catch_404)
      get :index
    end

  end


  describe 'general_error' do

    controller(ErrorTrappingTestController) do
      def index
        raise
      end
    end


    it "catches a routing error correctly" do
      expect(controller).to receive(:catch_500)
      get :index
    end

  end

end
