# frozen_string_literal: true

# Enable Code Coverage using SimpleCov [https://github.com/simplecov-ruby/simplecov]
require 'simplecov'
SimpleCov.start do
  project_name 'Tag Options'
  enable_coverage :branch

  add_filter '/test/'
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require_relative '../test/dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../test/dummy/db/migrate', __dir__)]
require 'rails/test_help'

require 'rails/test_unit/reporter'
Rails::TestUnitReporter.executable = 'bin/test'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('fixtures', __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = "#{ActiveSupport::TestCase.fixture_path}/files"
  ActiveSupport::TestCase.fixtures :all
end

# Enable Mocha for Moching and Stubbing [https://github.com/freerange/mocha]
require 'mocha/minitest'

# Enable Shoulda Context and Matchers [https://github.com/thoughtbot/shoulda]
require 'shoulda'
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
  end
end

# Filter out Minitest backtrace while allowing backtrace from other libraries to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
