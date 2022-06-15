require "tag_options/error"

module TagOptions
  module Errors
    class NotHashError < Error
      def initialize(key, *keys, type:)
        hash_path = [key, *keys].join("=>")
        super("unsupport type `#{type}` is already located at #{hash_path}")
      end
    end
  end
end
