# frozen_string_literal: true

require 'test_helper'
require 'tag_options/property_handler/tailwind_css'

module TagOptions
  module PropertyHandler
    class TailwindCSSTest < ActiveSupport::TestCase
      setup { TagOptions.configuration.property_handlers << 'TagOptions::PropertyHandler::TailwindCSS' }
      teardown { TagOptions.reset_configuration }

      subject { TagOptions::Hash.new(class: 'ml-1') }

      should 'sort classes using headwind' do
        subject.combine_with_class!('flex mr-1')
        assert_equal 'flex mr-1 ml-1', subject[:class]
      end
    end
  end
end
