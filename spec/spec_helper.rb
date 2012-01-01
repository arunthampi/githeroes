# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'webmock/rspec'
require 'delayed_job_spec_helper'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
# Add Factories
Dir[Rails.root.join("spec/factories/**/*.rb")].each {|f| require f}
# Add Routing
Dir[Rails.root.join("spec/routing/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Devise Helpers
  config.include Devise::TestHelpers, :type => :controller

  # Delayed Job Helpers
  config.include DelayedJobSpecHelper

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Disable Net Connects with FakeWeb
  WebMock.disable_net_connect!

  config.before(:each, :type => :controller) do
    self.class.render_views
  end
end
