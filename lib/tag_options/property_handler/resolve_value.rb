# frozen_string_literal: true

require 'tag_options/configuration'

module TagOptions
  module PropertyHandler
    class ResolveValue
      attr_reader :property

      def initialize(property)
        @property = property
      end

      def call(...)
        handler.call(...)
      end

      def self.call(property, *values, **conditions)
        new(property).call(*values, **conditions)
      end

    private

      def handler
        TagOptions.configuration.property_handlers.each do |handler_string|
          handler = handler_string.constantize
          return handler if handler.handler_for?(property)
        end
        TagOptions.configuration.fallback_property_handler.constantize
      end
    end
  end
end
