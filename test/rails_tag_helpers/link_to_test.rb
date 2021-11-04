# frozen_string_literal: true

require 'test_helper'

class LinkToTest < ActionView::TestCase
  context 'basic options' do
    subject { TagOptions::Hash.new(class: 'flex') }

    should 'render the link with specified text and options' do
      assert_dom_equal %(<a href="#" class="flex">text</a>), link_to('text', '#', subject)
    end

    should 'render the link with specified block text and options' do
      assert_dom_equal %(<a href="#" class="flex">text</a>), link_to('#', subject) { 'text' }
    end
  end

  context 'nested options' do
    subject { TagOptions::Hash.new(class: 'flex', data: { controller: 'dropdown', navbar: { target: 'mobileMenu' } }) }

    should 'render the link with specified text and options' do
      assert_dom_equal(
        %(<a href="#" class="flex" data-controller="dropdown" data-navbar-target="mobileMenu">text</a>),
        link_to('#', **subject) { 'text' }
      )
    end
  end
end
