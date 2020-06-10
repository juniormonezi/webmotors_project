# frozen_string_literal: true

require 'report_builder'
require 'date'

Before do
  window = Capybara.current_session.current_window
  window.maximize
  
  @page = lambda do |klass|
    klass.new
  end
end

After do |scn|
  if ENV['screenshot']
    screenshot = HooksConfig.take_screenshot(scn)
    embed(screenshot, 'image/png;base64')
  end
end

at_exit do
  @infos = {
    'Browser' => Capybara.default_driver.to_s.capitalize,
    'Environment' => ENV['ENV_PREFIX'],
    'Data do Teste' => Time.now.strftime('%d/%B/%Y'),
    'Hora do Teste' => Time.now.strftime('%HH%MM%SS')
  }

  ReportBuilder.configure do |config|
    config.input_path = 'log/report.json'
    config.report_path = 'log/report'
    config.report_types = [:html]
    config.report_title = 'Automação WebMotors'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end
