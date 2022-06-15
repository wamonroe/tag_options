require "tag_options/error"

module TagOptions
  module Errors
    class ResolverError < Error
      def initialize(name)
        super("a resolver named `#{name}` has not been registered")
      end
    end
  end
end
