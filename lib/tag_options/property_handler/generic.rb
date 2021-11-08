# frozen_string_literal: true

require 'tag_options/property_handler/base'

module TagOptions
  module PropertyHandler
    class Generic < Base
      MATCHER = /\A.*\z/.freeze

      def call
        combine_values(*values, **conditions)
      end
    end
  end
end
