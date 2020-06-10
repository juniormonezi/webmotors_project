# frozen_string_literal: false

# Module to configure screenshoot
module ScreenshotSetup
    include Capybara::DSL
  
    def take_screenshot(scenario, condition = true)
      date = Time.now.strftime('%Y/%B/%d')
      time = Time.now.strftime('%HH%MM%SS')
      scn_name = scenario.name.gsub(%r{([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)}, '_')
      screenshot = if scenario.failed? && condition
                     "#{Dir.pwd}/log/screenshots/failure/#{date}/#{scn_name}/#{time}.png"
                   else
                     "#{Dir.pwd}/log/screenshots/success/#{date}/#{scn_name}/#{time}.png"
                   end
      screenshot = screenshot.tr!(' ', '_') if screenshot.include?(' ')
      save_screenshot(screenshot)
      image = open(screenshot, 'rb', &:read)
      encoded_img = Base64.encode64(image)
      encoded_img
    end
  end
  