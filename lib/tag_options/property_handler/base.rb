# frozen_string_literal: true

module TagOptions
  module PropertyHandler
    class Base
      attr_reader :values, :conditions

      def initialize(*values, **conditions)
        @values = values
        @conditions = conditions
      end

      def self.call(...)
        new(...).call
      end

      def self.handler_for?(property_name)
        self::MATCHER.match?(property_name.to_s)
      end

    private

      def combine_values(*values, **conditions)
        resolve_uniq_values(*values, **conditions).join(' ')
      end

      def resolve_uniq_values(*values, **conditions)
        [*values, *resolve_conditions(conditions)].map { |v| v.to_s.split }.flatten.compact.uniq
      end

      def resolve_conditions(conditions)
        conditions.select { |_key, value| value }.keys
      end
    end
  end
end
