# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class MethodMissingHashTest < ActiveSupport::TestCase
    subject do
      TagOptions::Hash.new
    end

    should 'raise an NoMethodError when an unknown method is called' do
      assert_raises(NoMethodError) { subject.missing_method }
    end
  end
end
