# frozen_string_literal: true

require 'tag_options/attribute_handler/base'

module TagOptions
  module AttributeHandler
    class Style < Base
      MATCHER = /\Astyle\z/.freeze

      def call
        styles.map { |p, v| "#{p}: #{v};" }.join(' ')
      end

    private

      def styles
        styles_from_values.merge(styles_from_conditions)
      end

      def styles_from_values
        style_hash_from(values)
      end

      def styles_from_conditions
        style_hash_from(resolve_conditions(conditions))
      end

      def style_hash_from(strings)
        {}.tap do |result|
          Array(strings).each do |string|
            string.to_s.split(';').compact.each do |property_value_pair|
              property, value = property_value_pair.split(':')
              next unless property && value

              result[property.strip.downcase.to_sym] = value.strip
            end
          end
        end
      end
    end
  end
end
