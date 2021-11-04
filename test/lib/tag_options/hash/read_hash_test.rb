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

    should 'read propertys passed as strings' do
      assert_equal 'flex', subject['class']
    end

    should 'read propertys passed as symbols' do
      assert_equal 'flex', subject[:class]
    end

    should 'read propertys seperated by dashes' do
      assert_equal 'dropdown', subject['data-controller']
    end

    should 'read propertys seperated by underscores' do
      assert_equal 'dropdown', subject[:data_controller]
    end

    should 'return nil if the property does not exist' do
      assert_nil subject[:missing]
    end

    should 'return nil if a nested property is does not exist' do
      assert_nil subject[:data_missing]
    end
  end
end
