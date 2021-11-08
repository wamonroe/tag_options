# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class ConfigurationTest < ActiveSupport::TestCase
    subject { TagOptions }

    context 'configure' do
      should 'yield the configuration' do
        configuration_mock = mock
        subject.expects(:configuration).returns(configuration_mock)
        subject.configure do |configuration|
          assert_equal configuration_mock, configuration
        end
      end
    end
  end
end
