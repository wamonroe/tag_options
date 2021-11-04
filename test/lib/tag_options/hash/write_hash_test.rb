# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class WriteHashTest < ActiveSupport::TestCase
    subject do
      TagOptions::Hash.new
    end

    should 'assign values to the specified key by symbol' do
      subject[:class] = 'flex'
      assert_equal({ class: 'flex' }, subject)
    end

    should 'assign values to the key by string' do
      subject['data-controller'] = 'dropdown'
      assert_equal({ 'data-controller': 'dropdown' }, subject)
    end

    should 'assign nested key/values to flattened keys' do
      subject[:data] = { dropdown: { target: 'menu' } }
      assert_equal({ 'data-dropdown-target': 'menu' }, subject)
    end
  end
end
