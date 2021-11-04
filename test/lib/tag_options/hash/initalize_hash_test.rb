# frozen_string_literal: true

require 'test_helper'

module TagOptions
  class InitializeHashTest < ActiveSupport::TestCase
    should 'instantiate' do
      assert_instance_of TagOptions::Hash, TagOptions::Hash.new
    end

    should 'instantiate from a flat hash' do
      hash = { class: 'flex mt-1' }
      assert_equal hash, TagOptions::Hash.new(hash)
    end

    should 'instantiate from a nested hash' do
      hash = { class: 'flex mt-1', 'data-controller': 'dropdown' }
      assert_equal hash, TagOptions::Hash.new(
        class: 'flex mt-1',
        data: { controller: 'dropdown' }
      )
    end

    should 'instantiate from dashed and underscored keys' do
      hash = { 'data-controller': 'dropdown', 'data-action': 'dropdown#click' }
      assert_equal hash, TagOptions::Hash.new('data-controller': 'dropdown', data_action: 'dropdown#click')
    end

    should 'instantiate from complex nested, dashed, and underscored keys' do
      hash = {
        'data-controller': 'dropdown',
        'data-action': 'dropdown#click',
        'data-navbar-target': 'mobile-menu',
        'data-dropdown-target': 'menu'
      }
      assert_equal hash, TagOptions::Hash.new(
        'data-controller': 'dropdown',
        data: { action: 'dropdown#click', navbar: { target: 'mobile-menu' } },
        data_dropdown_target: 'menu'
      )
    end
  end
end
