# frozen_string_literal: true

require 'test_helper'

class TagTest < ActionView::TestCase
  context 'basic options' do
    subject { TagOptions::Hash.new(class: 'flex') }

    should 'render the tag with specified content and options' do
      assert_dom_equal %(<div class="flex">content</div>), tag.div('content', **subject)
    end

    should 'render the tag with specified block content and options' do
      assert_dom_equal %(<div class="flex">content</div>), tag.div(**subject) { 'content' }
    end
  end

  context 'nested options' do
    subject { TagOptions::Hash.new(class: 'flex', data: { controller: 'dropdown', navbar: { target: 'mobileMenu' } }) }

    should 'render the tag with specified content and options' do
      assert_dom_equal(
        %(<div class="flex" data-controller="dropdown" data-navbar-target="mobileMenu">content</div>),
        tag.div(**subject) { 'content' }
      )
    end
  end
end
