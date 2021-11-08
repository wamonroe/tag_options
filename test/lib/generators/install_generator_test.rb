# frozen_string_literal: true

require 'test_helper'
require 'rails/generators/test_case'
require 'generators/tag_options/install/install_generator'
require 'tag_options/configuration'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests TagOptions::InstallGenerator
  destination File.expand_path('../../tmp', __dir__)

  setup do
    run_generator
  end

  teardown do
    FileUtils.rm_rf(destination_root)
  end

  should 'create initializer' do
    assert_file initializer_file
  end

  should 'contain the current default configuration values' do
    default_property_handlers = TagOptions.configuration.property_handlers
    default_fallback_handler = TagOptions.configuration.fallback_property_handler
    load initializer_path
    assert_equal default_property_handlers, TagOptions.configuration.property_handlers
    assert_equal default_fallback_handler, TagOptions.configuration.fallback_property_handler
  end

private

  def initializer_file
    'config/initializers/tag_options.rb'
  end

  def initializer_path
    File.join(destination_root, initializer_file)
  end
end
