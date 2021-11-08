# frozen_string_literal: true

require 'test_helper'

module TagOptions
  module PropertyHandler
    class ConfigurationTest < ActiveSupport::TestCase
      subject { TagOptions::Hash.new(style: 'display: flex;') }

      context '.handler_for?' do
        should 'match the `style` property' do
          assert TagOptions::PropertyHandler::Style.handler_for?('style')
        end
      end

      context '#combine_with!' do
        should 'add new style property:value pairs by string' do
          subject.combine_with_style!('color: red; background: white;')
          assert_equal 'display: flex; color: red; background: white;', subject[:style]
        end

        should 'add new style property:value pairs by array' do
          subject.combine_with_style!('color: red', 'background: white')
          assert_equal 'display: flex; color: red; background: white;', subject[:style]
        end

        should 'add new style property:value pairs with a mix of strings and arrays' do
          subject.combine_with_style!('color: red', 'background: white; width: 100%;')
          assert_equal 'display: flex; color: red; background: white; width: 100%;', subject[:style]
        end

        should 'allow values to be conditionally combined' do
          subject.combine_with_style!('background: white', 'color: red': true, 'color: green': false)
          assert_equal 'display: flex; background: white; color: red;', subject[:style]
        end

        should 'override a property and only that property if it already exists' do
          subject.combine_with_style!('color: red')
          subject.combine_with_style!('display: block')
          assert_equal 'display: block; color: red;', subject[:style]
        end

        should 'ignore invalid property:value pairs' do
          subject.combine_with_style!('color: red; background')
          assert_equal 'display: flex; color: red;', subject[:style]
        end
      end

      context '#override!' do
        should 'override all existing style property:value pairs' do
          subject.override_style!('color: red')
          assert_equal 'color: red;', subject[:style]
        end
      end
    end
  end
end
