# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class ActionMatcherHashTest < ActiveSupport::TestCase
    subject do
      TagOptions::Hash.new.send(:action_matcher)
    end

    should 'match combine_with_<name>! methods' do
      assert subject.match?('combine_with_class!')
    end

    should 'match override_<name>! methods' do
      assert subject.match?('override_class!')
    end

    should 'return a named action group with the expected value' do
      assert_equal 'combine_with', subject.match('combine_with_class!')['action']
    end

    should 'return a named property group with the expected value' do
      assert_equal 'class', subject.match('combine_with_class!')['property']
    end
  end
end
