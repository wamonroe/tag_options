# frozen_string_literal: true

require 'tag_options/attribute_handler/base'

module TagOptions
  module AttributeHandler
    class Generic < Base
      MATCHER = /\A.*\z/.freeze

      def call
        combine_values(*values, **conditions)
      end
    end
  end
end
