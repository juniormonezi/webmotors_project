require 'report_builder'
require 'date'
require_relative "#{Dir.pwd}/features/support/load_file.rb"

at_exit do
  time = Time.now.to_s
  ReportBuilder.configure do |config|
    config.json_path = 'log/report.json'
    config.report_path = 'log/cucumber_relatorio'
    config.report_types = [:html]
    config.report_title = 'WebMotors - Testes automatizados em API'
    config.compress_images = false
    config.color = 'indigo'
    config.additional_info = { 'Project name' => 'WebMotors', 'Platform' => 'API', 'Report generated' => time }
  end
  ReportBuilder.build_report
end
