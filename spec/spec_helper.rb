require 'rubygems'

# Configure Rails Environment
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require 'rspec/rails'
require 'capybara/rspec'
require 'refinerycms-testing'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :rspec
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.extend Refinery::Testing::ControllerMacros::Authentication, :type => :controller
  config.include Refinery::Testing::ControllerMacros::Routes, :type => :controller
  config.extend Refinery::Testing::FeatureMacros::Authentication, :type => :feature

  # set some config values so that image and resource factories don't fail to create
  config.before do
    Refinery::Images.max_image_size = 5_242_880 if defined?(Refinery::Images)
    Refinery::Resources.max_file_size = 52_428_800 if defined?(Refinery::Resources)
  end
end

# set javascript driver for capybara
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories including factories.
([Rails.root.to_s] | ::Refinery::Plugins.registered.pathnames).map{|p|
  Dir[File.join(p, 'spec', 'support', '**', '*.rb').to_s]
}.flatten.sort.each do |support_file|
  require support_file
end
