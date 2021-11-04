# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class VersionTest < ActiveSupport::TestCase
    should 'have a version number' do
      assert TagOptions::VERSION
    end
  end
end
