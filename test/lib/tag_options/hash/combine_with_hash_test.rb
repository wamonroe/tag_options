# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class CombineWithHashTest < ActiveSupport::TestCase
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

    should 'combine values to specified propertys' do
      subject.combine_with!(class: 'mt-1')
      assert_equal 'flex mt-1', subject[:class]
    end

    should 'combine values to specified propertys without duplication' do
      subject.combine_with!(class: 'flex mt-1')
      assert_equal 'flex mt-1', subject[:class]
    end

    should 'combine values to nested propertys without overwriting siblings' do
      subject.combine_with!(data: { controller: 'navbar' })
      assert_equal 'click->dropdown#hide', subject[:data_action]
      assert_equal 'dropdown navbar', subject[:data_controller]
    end

    should 'allow values to be conditionally combined with specified propertys' do
      subject.combine_with!(class: ['mt-1', { 'flex-col': true, hidden: false }])
      assert_equal 'flex mt-1 flex-col', subject[:class]
    end

    should 'combine values to specified when called using #combine_with_<property>' do
      subject.combine_with_class!('mt-1')
      assert_equal 'flex mt-1', subject[:class]
    end

    should 'conditionally combine values to specified when called using #combine_with_<property>' do
      subject.combine_with_class!('mt-1', 'flex-col': true, hidden: false)
      assert_equal 'flex mt-1 flex-col', subject[:class]
    end
  end
end
