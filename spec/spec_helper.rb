# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.mock_with :rspec

  #To clean database before every scenario run
  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  #added devise helpers for rspec
  config.include Devise::TestHelpers, :type => :controller

  #Config for locating the api files for api tests
  config.include RSpec::Rails::RequestExampleGroup, :type => :request, :example_group => {
    :file_path => /spec\/apis/
  }
end
