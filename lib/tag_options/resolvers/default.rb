require "tag_options/resolver"

module TagOptions
  module Resolvers
    class Default < Resolver
      def call
        @values.map { |v| v.to_s.split }.flatten.compact.uniq.join(" ")
      end
    end
  end
end
