# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class ReadHashTest < ActiveSupport::TestCase
    subject do
      TagOptions::Hash.new(
        class: 'flex',
        data: {
          controller: 'dropdown',
          action: 'dropdown#toggle',
          navbar: {
            target: 'menu'
          }
        }
      )
    end

    should 'read keys passed as strings' do
      assert_equal 'flex', subject['class']
    end

    should 'read keys passed as symbols' do
      assert_equal 'flex', subject[:class]
    end

    should 'read keys seperated by dashes' do
      assert_equal 'dropdown', subject['data-controller']
    end

    should 'read keys seperated by underscores' do
      assert_equal 'dropdown', subject[:data_controller]
    end

    should 'return nil if the key does not exist' do
      assert_nil subject[:missing]
    end

    should 'return nil if a nested key is does not exist' do
      assert_nil subject[:data_missing]
    end
  end
end
