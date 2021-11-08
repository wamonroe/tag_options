# frozen_string_literal: true

require 'tag_options/property_handler/base'

module TagOptions
  module PropertyHandler
    class Singular < Base
      MATCHER = /\Aid|role|aria-.+\z/.freeze

      def call
        resolve_uniq_values(*values, **conditions).last.to_s
      end
    end
  end
end
