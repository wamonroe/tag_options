# frozen_string_literal: true

module TagOptions
  module AttributeHandler
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
        TagOptions.configuration.attribute_handlers.each do |handler|
          return handler if handler.safe_constantize&.handler_for?(property)
        end
        TagOptions.configuration.fallback_attribute_handler.constantize
      end
    end
  end
end
