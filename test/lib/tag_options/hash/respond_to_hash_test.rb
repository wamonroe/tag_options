# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class RespondToHashTest < ActiveSupport::TestCase
    subject do
      TagOptions::Hash.new
    end

    should 'return true for combine_with_<name>! methods' do
      assert_respond_to subject, :combine_with_class!
    end

    should 'return true for override_<name>! methods' do
      assert_respond_to subject, :override_class!
    end

    should 'return false for unknown methods' do
      refute_respond_to subject, :missing_method
    end
  end
end
