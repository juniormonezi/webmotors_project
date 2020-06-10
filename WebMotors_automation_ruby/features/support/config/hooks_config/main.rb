# frozen_string_literal: true

%w[
  ./screenshot
].each { |dependency| require_relative dependency }

# Class to configure Hooks
class HooksConfig
  class << self
    include ScreenshotSetup

    def take_screenshot(scenario, condition = true)
      super
    end
  end
end
