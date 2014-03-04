require 'spec_helper'
require 'error_trapping'

class TestErrorTrapping
  include ErrorTrapping
end


describe TestErrorTrapping do

  describe :raise_404 do
    it "raises a 404 with the instance method" do
      expect{ TestErrorTrapping.new.raise_404 }.to raise_error(ActionController::RoutingError)
    end

    it "raises a 404 with the class method" do
      expect {TestErrorTrapping.raise_404 }.to raise_error(ActionController::RoutingError)
    end

  end



end
