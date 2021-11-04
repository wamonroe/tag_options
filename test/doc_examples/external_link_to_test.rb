# frozen_string_literal: true

require 'test_helper'

class ExternalLinkToTest < ActionView::TestCase
  def external_link_to(name, url, options={})
    options = TagOptions::Hash.new(options)
    options.combine_with_class!('external-link')
    link_to(name, url, options)
  end

  should 'render expected results' do
    assert_dom_equal(
      %(<a href="https://example.com" class="ml-2 external-link">Example</a>),
      external_link_to('Example', 'https://example.com', class: 'ml-2')
    )
  end
end
