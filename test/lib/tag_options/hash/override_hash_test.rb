# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class OverrideHashTest < ActiveSupport::TestCase
    subject do
      TagOptions::Hash.new(
        class: 'flex',
        data: {
          action: 'click->dropdown#hide',
          controller: 'dropdown',
          navbar: {
            target: 'menu'
          }
        }
      )
    end

    should 'override values to specified properties' do
      subject.override!(class: 'block')
      assert_equal 'block', subject[:class]
    end

    should 'override values to nested properties without overwriting siblings' do
      subject.override!(data: { controller: 'navbar' })
      assert_equal 'click->dropdown#hide', subject[:data_action]
      assert_equal 'navbar', subject[:data_controller]
    end

    should 'allow values to be conditionally overridden with specified properties' do
      subject.override!(class: ['block', { 'flex-col': true, hidden: false }])
      assert_equal 'block flex-col', subject[:class]
    end

    should 'override values to specified when called using #override_with_<property>' do
      subject.override_class!('block')
      assert_equal 'block', subject[:class]
    end

    should 'conditionally override values to specified when called using #override_with_<property>' do
      subject.override_class!('block', 'flex-col': true, hidden: false)
      assert_equal 'block flex-col', subject[:class]
    end
  end
end
