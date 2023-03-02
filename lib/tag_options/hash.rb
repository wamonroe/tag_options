require "active_support/callbacks"
require "active_support/core_ext/hash/indifferent_access"
require "tag_options/hash_at"
require "tag_options/errors/not_hash_error"

module TagOptions
  class Hash < ActiveSupport::HashWithIndifferentAccess
    include ActiveSupport::Callbacks
    define_callbacks :initialize

    def initialize(hash = {})
      run_callbacks :initialize do
        hash.each do |key, value|
          self[key] = value.is_a?(::Hash) ? self.class.new(value) : value
        end
      end
    end

    def at(key, *nested_keys, as: :default)
      TagOptions::HashAt.new(opt_hash: self, keys: [key, *nested_keys], as: as)
    end

    def dig(*keys)
      keys.size.zero? ? self : super
    end

    def populate!(*keys)
      populated_keys = []
      data = self
      keys.each do |key|
        data[key] ||= self.class.new
        data = data[key]
        unless data.is_a?(self.class)
          raise TagOptions::Errors::NotHashError.new(populated_keys, type: data.class)
        end
      end
      self
    end
  end
end
