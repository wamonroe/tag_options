require "tag_options/resolver"

module TagOptions
  module Resolvers
    class Style < Resolver
      def call
        styles.map { |p, v| "#{p}: #{v};" }.join(" ")
      end

      private

      def styles
        {}.tap do |result|
          @values.each do |string|
            string.to_s.split(";").compact.each do |property_value_pair|
              property, value = property_value_pair.split(":")
              next unless property && value

              result[property.strip.downcase.to_sym] = value.strip
            end
          end
        end
      end
    end
  end
end
