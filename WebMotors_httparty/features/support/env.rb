# frozen_string_literal: true

require 'cucumber'
require 'httparty'
require 'report_builder'
require 'rspec'
require 'yaml'
require_relative 'page_objects.rb'
require_relative 'load_file.rb'

World(PageObjects)
World(LoadFile)

ENVIRONMENT_TYPE ||= ENV['ENVIRONMENT_TYPE']
