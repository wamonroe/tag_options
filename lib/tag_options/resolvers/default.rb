require "tag_options/resolver"

module TagOptions
  module Resolvers
    class Default < Resolver
      def call
        values.join(" ")
      end

      def values
        @values.map { |v| v.to_s.split }.flatten.compact.uniq
      end
    end
  end
end
